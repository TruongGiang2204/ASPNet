using webdemo.Context;
using webdemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Controllers
{
    public class PaymentController : Controller
    {
        // GET: Payment
        WebASPNetEntities objWebASPEntities = new WebASPNetEntities();
        public ActionResult Index()
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                // lấy thông tin từ giỏ hàng trong session
                var istCart = (List<CartModel>)Session["cart"];

                // tạo dữ liệu cho Order
                Order objOrder = new Order();
                objOrder.name = "DonHang-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                objOrder.UserId = int.Parse(Session["idUser"].ToString());
                objOrder.CreatedOnUtc = DateTime.Now;
                objOrder.Status = 17;

                objWebASPEntities.Orders.Add(objOrder);

                // lưu thông tin vào bảng Order
                objWebASPEntities.SaveChanges();

                // Lấy OrderId vừa tạo để lưu vào bảng OrderDetail
                int orderId = objOrder.Id;
                List<OrderDetail> lstOrderDetail = new List<OrderDetail>();

                foreach (var item in istCart)
                {
                    OrderDetail obj = new OrderDetail();
                    obj.Quantity = item.Quantity;
                    obj.OrderId = orderId;
                    obj.ProductId = item.Product.Id;
                    lstOrderDetail.Add(obj);
                }

                objWebASPEntities.OrderDetails.AddRange(lstOrderDetail);
                objWebASPEntities.SaveChanges();
                Session["cart"] = null; // Thêm dòng này để xóa giỏ hàng
            }

            return View();
        }
    }
}