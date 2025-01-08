using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Context;
using System.IO;
using System.Data.Entity;

namespace webdemo.Areas.Admin.Controllers
{
   
    public class ProductController : Controller
    {
        WebASPNetEntities objWebASPEntities = new WebASPNetEntities();
        // GET: Admin/Product
        
        public ActionResult Index()
        {
            var lstProduct = objWebASPEntities.Products.ToList();
            return View(lstProduct);
        }
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(objWebASPEntities.Categories, "Id", "Name");
            ViewBag.BrandID = new SelectList(objWebASPEntities.Brands, "Id", "Name");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Product product, HttpPostedFileBase ProductImage)
        {
            if (ModelState.IsValid)
            {
                if (ProductImage != null && ProductImage.ContentLength > 0)
                {
                    // Lưu hình ảnh vào thư mục Images (hoặc thư mục bạn muốn)
                    var fileName = Path.GetFileName(ProductImage.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/images/items/"), fileName);
                    ProductImage.SaveAs(path);

                    // Lưu tên file hình ảnh vào thuộc tính ProductImage
                    product.Image = fileName;
                }

                objWebASPEntities.Products.Add(product);
                objWebASPEntities.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(objWebASPEntities.Categories, "Id", "Name", product.CategoryId);
            ViewBag.BrandID = new SelectList(objWebASPEntities.Brands, "Id", "Name", product.BrandId);

            return View(product);
        }

        // GET: Admin/Product
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) return HttpNotFound();

            var product = objWebASPEntities.Products.Find(id);
            if (product == null) return HttpNotFound();

            ViewBag.CategoryID = new SelectList(objWebASPEntities.Categories, "Id", "Name", product.CategoryId);
            ViewBag.BrandID = new SelectList(objWebASPEntities.Brands, "Id", "Name", product.BrandId);
            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product product, HttpPostedFileBase ProductImage)
        {
            if (ModelState.IsValid)
            {
                if (ProductImage != null && ProductImage.ContentLength > 0)
                {
                    // Lưu hình ảnh vào thư mục Images (hoặc thư mục bạn muốn)
                    var fileName = Path.GetFileName(ProductImage.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/images/products/"), fileName);

                    // Kiểm tra nếu thư mục không tồn tại, tạo mới thư mục
                    var directory = Path.GetDirectoryName(path);
                    if (!Directory.Exists(directory))
                    {
                        Directory.CreateDirectory(directory);
                    }

                    // Lưu tệp hình ảnh
                    ProductImage.SaveAs(path);

                    // Lưu tên file hình ảnh vào thuộc tính ProductImage
                    product.Image = fileName;
                }

                objWebASPEntities.Entry(product).State = EntityState.Modified;
                objWebASPEntities.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(product);
        }
        // GET: Admin/Product/Delete/5
        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id == null) return HttpNotFound();

            var product = objWebASPEntities.Products.Find(id);
            if (product == null) return HttpNotFound();

            return View(product);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult ConfirmDelete(int id)
        {
            var product = objWebASPEntities.Products.Find(id);
            if (product == null) return HttpNotFound();

            objWebASPEntities.Products.Remove(product);
            objWebASPEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Admin/Product/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null) return HttpNotFound();

            var product = objWebASPEntities.Products.Find(id);
            if (product == null) return HttpNotFound();

            return View(product);
        }
    }
}