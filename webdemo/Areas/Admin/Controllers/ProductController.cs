using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Context;
using System.IO;
using System.Data.Entity;
using PagedList;
using webdemo.Filters;

namespace webdemo.Areas.Admin.Controllers
{
   
    public class ProductController : Controller
    {
        WebASPNetEntities objWebASPEntities = new WebASPNetEntities();
        // GET: Admin/Product
        [AdminAuthorize]
        public ActionResult Index(string currentFilter, string SearchString, int? page)
        {
            // Kiểm tra xem người dùng có thay đổi bộ lọc tìm kiếm không
            if (SearchString != null)
            {
                page = 1; // Nếu có tìm kiếm mới, về trang đầu
            }
            else
            {
                SearchString = currentFilter; // Nếu không có tìm kiếm mới, dùng bộ lọc trước đó
            }

            // Lọc danh sách sản phẩm
            var lstProduct = objWebASPEntities.Products
                .Where(p => p.Deleted != true) // Lọc những sản phẩm chưa bị xóa
                .AsQueryable(); // Chuyển về kiểu IQueryable để dễ dàng sử dụng LINQ

            // Nếu có tìm kiếm, lọc theo tên sản phẩm
            if (!string.IsNullOrEmpty(SearchString))
            {
                lstProduct = lstProduct.Where(n => n.Name.Contains(SearchString));
            }

            // Đặt bộ lọc hiện tại vào ViewBag để giữ trạng thái tìm kiếm
            ViewBag.CurrentFilter = SearchString;

            // Phân trang
            int pageSize = 10; // Số sản phẩm mỗi trang
            int pageNumber = (page ?? 1); // Lấy số trang, mặc định là 1 nếu không có

            // Sắp xếp sản phẩm theo ID giảm dần
            lstProduct = lstProduct.OrderByDescending(n => n.Id);

            // Chuyển danh sách sản phẩm sang dạng phân trang
            return View(lstProduct.ToPagedList(pageNumber, pageSize));
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
        [ValidateInput(false)]
        public ActionResult Create(Product product, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                if (Image != null && Image.ContentLength > 0)
                {
                    // Lưu hình ảnh vào thư mục Images (hoặc thư mục bạn muốn)
                    var fileName = Path.GetFileName(Image.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/images/products/"), fileName);

                    System.Diagnostics.Debug.WriteLine("Đường dẫn lưu file: " + path);
                    Image.SaveAs(path);

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
        public ActionResult Edit(Product product, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                if (Image != null && Image.ContentLength > 0)
                {
                    // Lấy tên file
                    var fileName = Path.GetFileName(Image.FileName);

                    // Đường dẫn lưu trữ file
                    var path = Path.Combine(Server.MapPath("~/Content/images/products/"), fileName);

                    // In thông tin ra log để kiểm tra
                    System.Diagnostics.Debug.WriteLine("Saving image to: " + path);

                    // Tạo thư mục nếu chưa tồn tại
                    if (!Directory.Exists(Path.GetDirectoryName(path)))
                    {
                        Directory.CreateDirectory(Path.GetDirectoryName(path));
                    }

                    // Lưu hình ảnh
                    Image.SaveAs(path);

                    // Gán tên file cho thuộc tính product.Image
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
        public ActionResult SoftDeleteProduct(int id)
        {
            var product = objWebASPEntities.Products.SingleOrDefault(p => p.Id == id);
            if (product != null)
            {
                product.Deleted = true; // Đánh dấu là bị xóa
                objWebASPEntities.SaveChanges();
            }
            return RedirectToAction("Index"); // Hoặc redirect đến trang phù hợp
        }
        public ActionResult RestoreProduct(int id)
        {
            var product = objWebASPEntities.Products.SingleOrDefault(p => p.Id == id);
            if (product != null)
            {
                product.Deleted = false; // Khôi phục sản phẩm
                objWebASPEntities.SaveChanges();
            }
            return RedirectToAction("Trash"); // Redirect đến trang thùng rác
        }
        public ActionResult Trash()
        {
            var deletedProducts = objWebASPEntities.Products.Where(p => p.Deleted == true).ToList();
            return View(deletedProducts); // Hiển thị danh sách sản phẩm bị xóa
        }

    }
}