using Microsoft.AspNetCore.Mvc;

namespace HeavyMetalBandsApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HeavyMetalBandsController : ControllerBase
    {
        private readonly ILogger<HeavyMetalBandsController> _logger;

        public HeavyMetalBandsController(ILogger<HeavyMetalBandsController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetHeavyMetalBands")]
        public IEnumerable<HeavyMetalBand> Get()
        {
            var bands = new List<HeavyMetalBand>();

            bands.Add(new HeavyMetalBand { Name = "Iron Maiden", YearCreated = "1975" });
            bands.Add(new HeavyMetalBand { Name = "Judas Priest", YearCreated = "1969" });
            bands.Add(new HeavyMetalBand { Name = "Saxon", YearCreated = "1975" });
            bands.Add(new HeavyMetalBand { Name = "DIO", YearCreated = "1982" });
            //bands.Add(new HeavyMetalBand { Name = "Kat", YearCreated = "1980" });
            //bands.Add(new HeavyMetalBand { Name = "Gamma Ray", YearCreated = "1982" });
            //bands.Add(new HeavyMetalBand { Name = "Aria", YearCreated = "1985" });

            return bands;
        }
    }
}
