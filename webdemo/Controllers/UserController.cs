using webdemo.Context;
using webdemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace webdemo.Controllers
{
    public class UserController : Controller
    {

        WebASPNetEntities objWebASPEntities = new WebASPNetEntities();
        // GET: User

        public ActionResult Register()
        {
            return View();
        }
        
       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(User _user)
        {
            if (ModelState.IsValid)
            {
                var check = objWebASPEntities.Users.FirstOrDefault(s => s.Email == _user.Email);
                if (check == null)
                {
                    _user.Password = GetMD5(_user.Password);
                    objWebASPEntities.Configuration.ValidateOnSaveEnabled = false;
                    objWebASPEntities.Users.Add(_user);
                    objWebASPEntities.SaveChanges();
                    return RedirectToAction("Login");
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return View();
                }


            }
            return View();


        }

        //create a string MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }


        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {
            if (ModelState.IsValid)
            {
                var f_password = GetMD5(password);
                var data = objWebASPEntities.Users.Where(s => s.Email.Equals(email) && s.Password.Equals(f_password)).ToList();

                if (data.Count() > 0)
                {
                    // Get the user data
                    var user = data.FirstOrDefault();

                    // Add session variables
                    Session["FullName"] = user.LastName + " " + user.FirstName;
                    Session["Email"] = user.Email;
                    Session["idUser"] = user.Id;
                    Session["IsAdmin"] = user.IsAdmin; // Store IsAdmin flag in session

                    // Log session values for debugging
                    System.Diagnostics.Debug.WriteLine("Session FullName: " + Session["FullName"]);
                    System.Diagnostics.Debug.WriteLine("Session Email: " + Session["Email"]);
                    System.Diagnostics.Debug.WriteLine("Session idUser: " + Session["idUser"]);
                    System.Diagnostics.Debug.WriteLine("Session IsAdmin: " + Session["IsAdmin"]);

                    // Redirect to appropriate page based on IsAdmin flag
                    if (user.IsAdmin.HasValue && user.IsAdmin.Value)
                    {
                        // If user is an admin, redirect to Admin Dashboard
                        return RedirectToAction("HomeAdmin", "Admin");
                    }
                    else
                    {
                        // If user is not an admin, redirect to regular user home page
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("Login");
                }
            }
            return View();
        }




        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }
    }
}