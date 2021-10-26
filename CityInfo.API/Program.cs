using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using NLog.Web;

namespace CityInfo.API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var logger = NLogBuilder
                    .ConfigureNLog("nlog.config")
                    .GetCurrentClassLogger();
            try
            {
                logger.Info("Initializing application...");
                CreateWebHostBuilder(args).Build().Run();
            }
            catch (System.Exception ex)
            {
                logger.Error(ex, "Applicationstopped becouse of exception.");
                throw;
            }
            finally
            {
                NLog.LogManager.Shutdown();
            }
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>()
                .UseNLog();
    }
}
