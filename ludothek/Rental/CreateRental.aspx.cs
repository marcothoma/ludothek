using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ludothek.Rental
{
    public partial class CreateRental : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AusleiheBeginn.Text = DateTime.Now.ToString("dd-MM-yyyy");
        }
    }
}