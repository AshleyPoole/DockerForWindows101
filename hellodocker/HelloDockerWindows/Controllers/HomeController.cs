using HelloDockerWindows.Models;

using Microsoft.AspNetCore.Mvc;

namespace HelloDockerWindows.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return this.View(new HomeViewModel());
        }
    }
}
