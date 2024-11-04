using System.Collections.Generic;
using System.Threading.Tasks;

namespace SeniorCitizenLibrary
{
    public interface INameEntryService
    {
        Task<List<NameEntry>> GetEntriesAsync();
        Task AddEntryAsync(NameEntry entry);
        Task UpdateEntryAsync(NameEntry entry);
        Task DeleteEntryAsync(string id);
    }
}
