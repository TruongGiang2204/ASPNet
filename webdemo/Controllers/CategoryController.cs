using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Context;

namespace webdemo.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        WebASPEntities2 objWebASPEntities = new WebASPEntities2();
        public ActionResult AllCategory()
        {
            var lstCategory = objWebASPEntities.Categories.ToList();

            return View(lstCategory);
        }
        public ActionResult ProductByCategory(int id)

        {
            var listProduct = objWebASPEntities.Products.Where(n => n.CategoryId == id).ToList();
            return View(listProduct);
        }
    }
}