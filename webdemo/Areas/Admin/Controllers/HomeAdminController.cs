﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webdemo.Context;

namespace webdemo.Areas.Admin.Controllers
{
    public class HomeAdminController : Controller
    {
        // GET: Admin/HomeAdmin
        //WebASPEntities2 objWebASPEntities = new WebASPEntities2();
        public ActionResult Index()
        {
            //if (Session["isUser"] != null)
            //{
            //    var lstProduct = objWebASPEntities.Products.ToList();
            //    return View(lstProduct);
            //}    
            //else
            //{
            //    return View("Login");
            //}    
            return View();
        }
    }
}