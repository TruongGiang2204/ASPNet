using System.Web;
using System.Web.Mvc;

namespace webdemo.Filters // Đổi namespace theo dự án của bạn
{
    public class AdminAuthorizeAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            // Kiểm tra Session["IsAdmin"]
            var isAdmin = httpContext.Session["IsAdmin"] != null && (bool)httpContext.Session["IsAdmin"];
            return isAdmin;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            // Chuyển hướng về HomeAdmin nếu không phải admin
            filterContext.Result = new RedirectToRouteResult(
                new System.Web.Routing.RouteValueDictionary(
                    new { controller = "HomeAdmin", action = "Index", area = "Admin" }
                )
            );
        }
    }
}
