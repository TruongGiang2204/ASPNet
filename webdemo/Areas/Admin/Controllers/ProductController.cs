using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Context;

namespace webdemo.Areas.Admin.Controllers
{
   
    public class ProductController : Controller
    {
        WebASPEntities2 objWebASPEntities = new WebASPEntities2();
        // GET: Admin/Product
        //public ActionResult ProductList()
        //{
        //    var lstPro = objWebASPEntities.Products.ToList();
        //    return View(lstPro);
        //}
    }
}