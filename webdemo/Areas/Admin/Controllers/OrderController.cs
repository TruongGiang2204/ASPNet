using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Context;
using webdemo.Filters;

namespace webdemo.Areas.Admin.Controllers
{
    public class OrderController : Controller
    {
        WebASPNetEntities objWebASPEntities = new WebASPNetEntities();
        [AdminAuthorize]
        public ActionResult Index(string searchTerm, int? page)
        {
            // Lấy tất cả các đơn hàng dưới dạng IQueryable
            var lstOrder = objWebASPEntities.Orders.AsQueryable();

            // Tìm kiếm theo tên đơn hàng
            if (!string.IsNullOrEmpty(searchTerm))
            {
                lstOrder = lstOrder.Where(p => p.name.Contains(searchTerm));
            }

            ViewBag.CurrentFilter = searchTerm;

            // Cài đặt phân trang
            int pageSize = 10;
            int pageNumber = page ?? 1;

            // Đảm bảo gọi ToPagedList() để nhận được IPagedList
            var pagedList = lstOrder.OrderBy(p => p.name).ToPagedList(pageNumber, pageSize);

            return View(pagedList);  // Trả về IPagedList<Order> cho view
        }
        public ActionResult Details(int? id)
        {
            if (id == null) return HttpNotFound();

            var order = objWebASPEntities.Categories.Find(id);
            if (order == null) return HttpNotFound();

            return View(order);
        }
    }
}