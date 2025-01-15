using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Context;
using System.Data.Entity;
using System.IO;
using webdemo.Filters;

namespace webdemo.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        WebASPNetEntities objWebASPEntities = new WebASPNetEntities();
        [AdminAuthorize]
        public ActionResult Index(string searchTerm, int? page)
        {
            // Khởi tạo danh sách danh mục và chỉ lấy những danh mục chưa bị xóa
            var lstCategory = objWebASPEntities.Categories
                .Where(c => c.Deleted != true) // Lọc các danh mục chưa bị xóa
                .AsQueryable(); // Chuyển về IQueryable để dễ dàng sử dụng LINQ

            // Kiểm tra và tìm kiếm theo tên danh mục
            if (!string.IsNullOrEmpty(searchTerm))
            {
                lstCategory = lstCategory.Where(c => c.Name.Contains(searchTerm));
            }

            // Lưu lại giá trị tìm kiếm hiện tại vào ViewBag
            ViewBag.CurrentFilter = searchTerm;

            // Cài đặt số danh mục hiển thị mỗi trang
            int pageSize = 10;
            int pageNumber = page ?? 1;

            // Sắp xếp danh sách theo tên danh mục (hoặc có thể theo Id nếu cần)
            lstCategory = lstCategory.OrderBy(c => c.Name);

            // Chuyển danh sách thành dạng phân trang và trả về
            var pagedList = lstCategory.ToPagedList(pageNumber, pageSize);

            return View(pagedList); // Trả về IPagedList<Category> cho View
        }

        // GET: Admin/Category/Create
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Category/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Category category, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                if (Image != null && Image.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(Image.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/images/category/"), fileName);

                    if (!Directory.Exists(Path.GetDirectoryName(path)))
                    {
                        Directory.CreateDirectory(Path.GetDirectoryName(path));
                    }

                    Image.SaveAs(path);
                    category.Image = fileName;
                }

                objWebASPEntities.Categories.Add(category);
                objWebASPEntities.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(category);
        }


        // GET: Admin/Category/Edit/5
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) return HttpNotFound();

            var category = objWebASPEntities.Categories.Find(id);
            if (category == null) return HttpNotFound();

            return View(category);
        }

        // POST: Admin/Category/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Category category, HttpPostedFileBase Image)
        {
            if (ModelState.IsValid)
            {
                if (Image != null && Image.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(Image.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/images/category/"), fileName);

                    if (!Directory.Exists(Path.GetDirectoryName(path)))
                    {
                        Directory.CreateDirectory(Path.GetDirectoryName(path));
                    }

                    Image.SaveAs(path);
                    category.Image = fileName;
                }

                objWebASPEntities.Entry(category).State = EntityState.Modified;
                objWebASPEntities.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(category);
        }

        // GET: Admin/Category/Delete/5
        [HttpGet]
        public ActionResult Delete(int? id)
        {
            if (id == null) return HttpNotFound();

            var category = objWebASPEntities.Categories.Find(id);
            if (category == null) return HttpNotFound();

            return View(category);
        }

        // POST: Admin/Category/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult ConfirmDelete(int id)
        {
            var category = objWebASPEntities.Categories.Find(id);
            if (category == null) return HttpNotFound();

            objWebASPEntities.Categories.Remove(category);
            objWebASPEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Admin/Category/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null) return HttpNotFound();

            var category = objWebASPEntities.Categories.Find(id);
            if (category == null) return HttpNotFound();

            return View(category);
        }
        public ActionResult SoftDeleteCategory(int id)
        {
            var category = objWebASPEntities.Categories.SingleOrDefault(p => p.Id == id);
            if (category != null)
            {
                category.Deleted = true; // Đánh dấu là bị xóa
                objWebASPEntities.SaveChanges();
            }
            return RedirectToAction("Index"); // Hoặc redirect đến trang phù hợp
        }
        public ActionResult RestoreCategory(int id)
        {
            var category = objWebASPEntities.Categories.SingleOrDefault(p => p.Id == id);
            if (category != null)
            {
                category.Deleted = false; // Khôi phục sản phẩm
                objWebASPEntities.SaveChanges();
            }
            return RedirectToAction("Trash"); // Redirect đến trang thùng rác
        }
        public ActionResult Trash()
        {
            var deletedCategories = objWebASPEntities.Categories.Where(p => p.Deleted == true).ToList();
            return View(deletedCategories); // Hiển thị danh sách sản phẩm bị xóa
        }
    }
}
