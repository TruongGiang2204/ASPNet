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
        WebASPNetEntities objWebASPEntities = new WebASPNetEntities();

        public ActionResult Index()
        {
            // Kiểm tra trạng thái đăng nhập
            if (Session["isUser"] != null && (bool)Session["isUser"])
            {
                ViewBag.Message = "Welcome " + Session["FullName"];
            }
            else
            {
                ViewBag.Message = "You are not logged in.";
            }

            // Chuẩn bị dữ liệu cho HomeModel
            HomeModel objHomeModel = new HomeModel();
            objHomeModel.ListProduct = objWebASPEntities.Products.ToList();
            objHomeModel.ListCategory = objWebASPEntities.Categories.ToList();

            return View(objHomeModel);
        }
        public ActionResult Search(string query)
        {
            if (string.IsNullOrEmpty(query))
            {
                return View("SearchResults", new List<Product>()); // Không có kết quả
            }

            // Tìm kiếm sản phẩm theo tên hoặc mô tả
            var products = objWebASPEntities.Products
                .Where(p => p.Name.Contains(query) || p.ShortDes.Contains(query))
                .ToList();

            // Trả về view với danh sách sản phẩm tìm được
            return View("SearchResults", products);
        }
    }   
}