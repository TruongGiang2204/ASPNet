using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using webdemo.Context;

namespace webdemo.Models
{
    public partial class ProductMasterData
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductMasterData()
        {
            this.OrderDetails = new HashSet<OrderDetail>();
        }
        
        public int Id { get; set; }

        
        public Nullable<int> CategoryId { get; set; }
        public Nullable<int> BrandId { get; set; }
        public Nullable<int> TypeId { get; set; }
        
        public string ShortDes { get; set; }
        [Required(ErrorMessage = "Product name is required.")]
        [Display(Name = "Tên sản phẩm")]
        public string Name { get; set; }

        public string FullDescription { get; set; }
        public Nullable<double> Price { get; set; }
        public Nullable<double> PriceDiscount { get; set; }
        public string Slug { get; set; }
        public string Image { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public Nullable<bool> ShowOnHomePage { get; set; }
        public Nullable<int> DisplayOrder { get; set; }
        public Nullable<System.DateTime> CreatedOnUtc { get; set; }
        public Nullable<System.DateTime> UpdatedOnUtc { get; set; }

        public virtual Brand Brand { get; set; }
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}