using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.Extensions;
using api.Interfaces;
using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
namespace api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ImageController : ControllerBase
    {
        private readonly Image _context;

        public ImageController(Image context)
        {
            _context = context;
        }

        // API để upload ảnh
        [HttpPost("upload")]
        public async Task<IActionResult> UploadImage(IFormFile file)
        {
            if (file == null || file.Length == 0)
            {
                return BadRequest("No file uploaded.");
            }

            // Kiểm tra kích thước file (ví dụ, giới hạn 5MB)
            if (file.Length > 100 * 1024 * 1024) // 5MB
            {
                return BadRequest("File is too large.");
            }

            using (var memoryStream = new MemoryStream())
            {
                await file.CopyToAsync(memoryStream);
                var image = new Image
                {
                    FileName = file.FileName,
                    ContentType = file.ContentType,
                    Data = memoryStream.ToArray()
                };

                _context.Images.Add(image);
                await _context.SaveChangesAsync();
            }

            return Ok(new { message = "Image uploaded successfully." });
        }


        [HttpGet("get/{id}")]
        public async Task<IActionResult> GetImage(int id)
        {
            var image = await _context.Images.FindAsync(id);
            if (image == null)
            {
                return NotFound("Image not found.");
            }

            return File(image.Data, image.ContentType, image.FileName);
        }

    }



}