using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace api.Extensions
{
    public static class ClaimExtensions
    {
        public static string GetUsername(this ClaimsPrincipal user)
        {
            var usernameClaim = user.Claims.SingleOrDefault(x => x.Type == ClaimTypes.Name);

            // Nếu không tìm thấy claim hoặc giá trị là null, ném ra ngoại lệ hoặc trả về một giá trị mặc định
            if (usernameClaim == null || string.IsNullOrEmpty(usernameClaim.Value))
            {
                throw new InvalidOperationException("Username claim not found.");
            }

            return usernameClaim.Value;
        }


    }
}