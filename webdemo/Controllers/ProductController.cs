using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Context;

namespace webdemo.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        WebASPEntities2 objWebASPEntities = new WebASPEntities2();
        public ActionResult AllProduct()
        {
            return View();
        }
        public ActionResult Detail(int id)
        {
            var objProduct = objWebASPEntities.Products.Where(n => n.id == id).FirstOrDefault();
            return View(objProduct);
        }
    }
}