using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace api.Models
{
    [Table("Portfolios")]
    public class Portfolio
    {
        public string AppUserId { get; set; }= default!;
        public int StockId { get; set; }= default!;
        public AppUser AppUser { get; set; }= default!;
        public Stock Stock { get; set; }= default!;
    }
}