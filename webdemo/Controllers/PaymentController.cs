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
        WebASPEntities2 objWebASPEntities = new WebASPEntities2();
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
                objOrder.Name = "DonHang-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                //objOrder.UserId = int.Parse(Session["idUser"].ToString());
                objOrder.CreatedOnUtc = DateTime.Now;
                objOrder.Status = 17;

                objWebASPEntities.Orders.Add(objOrder);

                // lưu thông tin vào bảng Order
                objWebASPEntities.SaveChanges();

                // Lấy OrderId vừa tạo để lưu vào bảng OrderDetail
                int orderId = objOrder.Id;
                List<OrderDetaill> lstOrderDetail = new List<OrderDetaill>();

                foreach (var item in istCart)
                {
                    OrderDetaill obj = new OrderDetaill();
                    obj.Quantity = item.Quantity;
                    obj.OrderId = orderId;
                    obj.ProductId = item.Product.id;
                    lstOrderDetail.Add(obj);
                }

                objWebASPEntities.OrderDetaills.AddRange(lstOrderDetail);
                objWebASPEntities.SaveChanges();
            }

            return View();
        }
    }
}