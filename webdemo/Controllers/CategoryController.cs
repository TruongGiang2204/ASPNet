using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Context;
using webdemo.Models;

namespace webdemo.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        WebASPNetEntities objWebASPEntities = new WebASPNetEntities();
        public ActionResult AllCategory()
        {
            var lstCategory = objWebASPEntities.Categories.ToList();

            return View(lstCategory);
        }
        public ActionResult ProductByCategory(int id)
        {
            HomeModel objHomeModel = new HomeModel();

            objHomeModel.ListProduct = objWebASPEntities.Products.Where(n => n.CategoryId == id).ToList();

            objHomeModel.ListCategoryAll = objWebASPEntities.Categories.ToList();

            

            return View(objHomeModel);
        }
    }
}