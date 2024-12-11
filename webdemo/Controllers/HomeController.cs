using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Context;
using webdemo.Models;

namespace webdemo.Controllers
{
    
    public class HomeController : Controller
    {
        WebASPEntities2 objWebASPEntities = new WebASPEntities2();

        public ActionResult Index()
        {
            HomeModel objHomeModel = new HomeModel();

            objHomeModel.ListProduct = objWebASPEntities.Products.ToList();
            objHomeModel.ListCategory = objWebASPEntities.Categories.ToList();
            return View(objHomeModel);
           
        }
    }
}