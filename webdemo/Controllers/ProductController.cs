using PagedList;
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
        WebASPNetEntities objWebASPEntities = new WebASPNetEntities();
        public ActionResult AllProduct(string currentFilter, string SearchString, int? page)
        {
            var lstProduct = new List<Product>();
            if (SearchString != null)
            {
                page = 1;
            }    
            else
            {
                SearchString = currentFilter;
            }
            if (!string.IsNullOrEmpty(SearchString))
            {
                lstProduct = objWebASPEntities.Products.Where(n => n.Name.Contains(SearchString)).ToList();
            }    
            else
            {
                lstProduct = objWebASPEntities.Products.ToList();
            }
            ViewBag.CurentFIlter = SearchString;
            int pageSize = 12;
            int pageNumber = (page ?? 1);
            lstProduct = lstProduct.OrderByDescending(n => n.Id).ToList();
            return View(lstProduct.ToPagedList(pageNumber, pageSize));
        }
       
        public ActionResult Detail(int id)
        {
            var objProduct = objWebASPEntities.Products.Where(n => n.Id == id).FirstOrDefault();
            return View(objProduct);
        }

    }
}