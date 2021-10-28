using CityInfo.API.Etities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CityInfo.API.Services
{
    public interface ICityInfoRepository 
    {
        IEnumerable<City> GetCities();
        City GetCity(int cityId, bool includePointsOfInterest);
        PointOfInterest GetPointOfInterestForCity(int cityId, int pointOfInterestId);
        IEnumerable<PointOfInterest> GetPointOfInterestForCity(int cityId);
    }
}
