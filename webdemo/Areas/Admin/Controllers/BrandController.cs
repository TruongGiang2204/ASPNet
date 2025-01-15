using webdemo.Context;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Filters;

namespace webdemo.Areas.Admin.Controllers
{
    public class BrandController : Controller
    {
        WebASPNetEntities objWebASPEntities = new WebASPNetEntities();
        // GET: Admin/Brand
        [AdminAuthorize]
        public ActionResult Index(string currentFilter, string SearchString, int? page)
        {
            // Khởi tạo danh sách thương hiệu
            var lstBrand = objWebASPEntities.Brands
                .Where(b => b.Deleted != true) // Lọc các thương hiệu chưa bị xóa
                .AsQueryable(); // Chuyển về IQueryable để dễ dàng sử dụng LINQ

            // Nếu có thay đổi từ tìm kiếm, reset trang về số 1
            if (SearchString != null)
            {
                page = 1;
            }
            else
            {
                SearchString = currentFilter;
            }

            // Kiểm tra và tìm kiếm theo tên thương hiệu
            if (!string.IsNullOrEmpty(SearchString))
            {
                lstBrand = lstBrand.Where(b => b.Name.Contains(SearchString));
            }

            // Lưu lại giá trị tìm kiếm hiện tại
            ViewBag.CurrentFilter = SearchString;

            // Cài đặt số thương hiệu hiển thị mỗi trang
            int pageSize = 10;
            int pageNumber = (page ?? 1);

            // Sắp xếp danh sách theo Id giảm dần
            lstBrand = lstBrand.OrderByDescending(b => b.Id);

            // Trả về danh sách đã phân trang
            return View(lstBrand.ToPagedList(pageNumber, pageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Brand brand, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                if (Image != null && Image.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(Image.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/images/brands/"), fileName);

                    if (!Directory.Exists(Path.GetDirectoryName(path)))
                    {
                        Directory.CreateDirectory(Path.GetDirectoryName(path));
                    }

                    Image.SaveAs(path);
                    brand.Image = fileName;
                }

                objWebASPEntities.Brands.Add(brand);
                objWebASPEntities.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(brand);
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) return HttpNotFound();

            var brand = objWebASPEntities.Brands.Find(id);
            if (brand == null) return HttpNotFound();

            return View(brand);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Brand brand, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                if (Image != null && Image.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(Image.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/images/brands/"), fileName);

                    if (!Directory.Exists(Path.GetDirectoryName(path)))
                    {
                        Directory.CreateDirectory(Path.GetDirectoryName(path));
                    }

                    Image.SaveAs(path);
                    brand.Image = fileName;
                }

                objWebASPEntities.Entry(brand).State = EntityState.Modified;
                objWebASPEntities.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(brand);
        }

        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id == null) return HttpNotFound();

            var brand = objWebASPEntities.Brands.Find(id);
            if (brand == null) return HttpNotFound();

            return View(brand);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult ConfirmDelete(int id)
        {
            var brand = objWebASPEntities.Brands.Find(id);
            if (brand == null) return HttpNotFound();

            objWebASPEntities.Brands.Remove(brand);
            objWebASPEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Details(int? id)
        {
            if (id == null) return HttpNotFound();

            var brand = objWebASPEntities.Brands.Find(id);
            if (brand == null) return HttpNotFound();

            return View(brand);
        }
        public ActionResult SoftDeleteBrand(int id)
        {
            var brand = objWebASPEntities.Brands.SingleOrDefault(p => p.Id == id);
            if (brand != null)
            {
                brand.Deleted = true; // Đánh dấu là bị xóa
                objWebASPEntities.SaveChanges();
            }
            return RedirectToAction("Index"); // Hoặc redirect đến trang phù hợp
        }
        public ActionResult RestoreBrand(int id)
        {
            var brand = objWebASPEntities.Brands.SingleOrDefault(p => p.Id == id);
            if (brand != null)
            {
                brand.Deleted = false; // Khôi phục sản phẩm
                objWebASPEntities.SaveChanges();
            }
            return RedirectToAction("Trash"); // Redirect đến trang thùng rác
        }
        public ActionResult Trash()
        {
            var deletedBrands = objWebASPEntities.Brands.Where(p => p.Deleted == true).ToList();
            return View(deletedBrands); // Hiển thị danh sách sản phẩm bị xóa
        }

    }
}