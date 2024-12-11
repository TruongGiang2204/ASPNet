using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Context;

namespace webdemo.Controllers
{
    
    public class HomeController : Controller
    {
        WebASPEntities1 objWebASPEntities = new WebASPEntities1();

        public ActionResult Index()
        {
            var lstProducts = objWebASPEntities.Products.ToList();
            return View(lstProducts);
            var lstCategories = objWebASPEntities.Products.ToList();
            return View(lstCategories);
        }
    }
}