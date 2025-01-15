using System.Linq;
using System.Web.Mvc;
using webdemo.Context;

namespace webdemo.Areas.Admin.Controllers
{
    public class HomeAdminController : Controller
    {
        private WebASPNetEntities objWebASPEntities = new WebASPNetEntities();

        public ActionResult Index()
        {
            // Kiểm tra nếu người dùng không phải là admin, chuyển hướng về trang chủ
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                return RedirectToAction("Index", "HomeAdmin");
            }

            // Thống kê tổng số sản phẩm, đơn hàng, khách hàng
            var totalProducts = objWebASPEntities.Products.Count();
            var totalOrders = objWebASPEntities.Orders.Count();
            var totalCustomers = objWebASPEntities.Users.Count();

            // Tính tổng doanh thu (cần kiểm tra nếu Product.PriceDiscount không phải null và Quantity là số hợp lệ)
            var totalRevenue = objWebASPEntities.OrderDetails
                .Where(od => od.Product != null && od.Quantity.HasValue && od.Product.PriceDiscount.HasValue)
                .Sum(od => od.Quantity.Value * od.Product.PriceDiscount.Value);

            // Truyền dữ liệu qua ViewBag hoặc ViewData để sử dụng trong View
            ViewBag.TotalProducts = totalProducts;
            ViewBag.TotalOrders = totalOrders;
            ViewBag.TotalCustomers = totalCustomers;
            ViewBag.TotalRevenue = totalRevenue;

            // Cập nhật tab đang hoạt động cho sidebar (nếu cần)
            ViewData["Active"] = "HomeAdmin";

            // Trả về View cho trang quản trị viên
            return View();
        }

    }
}
