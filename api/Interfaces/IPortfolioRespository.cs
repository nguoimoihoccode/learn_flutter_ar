using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.Models;

namespace api.Interfaces
{
    public interface IPortfolioRespository
    {
        Task<List<Stock>> GetUserPorfolio(AppUser user);
        Task<Portfolio> CreateAsync(Portfolio portfolio);
    }
}