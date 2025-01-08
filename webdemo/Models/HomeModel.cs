using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using webdemo.Context;

namespace webdemo.Models
{
    public class HomeModel
    {
        public List<Product> ListProduct { get; set; }
        public List<Category> ListCategory { get; set; }

       
        public List<Category> ListCategoryAll { get; set; }
    }
}