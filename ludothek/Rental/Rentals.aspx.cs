using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;
using ludothek.xmlResources.xmlClasses;
using System.Globalization;

namespace ludothek.Rental
{
    public partial class Rentals : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.Name.ToString() == "")
            {
                Response.Redirect("AccessDenied.aspx");
            }

            updateFlags.updateRentalsXmlActiveFlag();
            updateFlags.updateIsInLendOutFlag();
            showRentalGridView();
            showRentalHistoryGridView();
        }

        protected void showRentalGridView() {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("Ausleihe-Nr", typeof(string)));
            dt.Columns.Add(new DataColumn("Spiel", typeof(string)));
            dt.Columns.Add(new DataColumn("Beginn der Ausleihe", typeof(string)));
            dt.Columns.Add(new DataColumn("Ende der Ausleihe", typeof(string)));

            var xmlPath = System.Web.HttpContext.Current.Request.MapPath("~\\xmlResources\\xmlFiles\\") + "rentals.xml";
            XmlDocument xDocument = new XmlDocument();
            xDocument.Load(xmlPath);

            foreach (XmlNode node in xDocument.GetElementsByTagName("Rental"))
            {
                if ((new ListItem(node.SelectSingleNode("user").InnerText, node.Attributes["id"].Value)).ToString() == Context.User.Identity.Name.ToString() && (new ListItem(node.SelectSingleNode("active").InnerText, node.Attributes["id"].Value)).ToString() == "true")
                {
                    dr = dt.NewRow();
                    dr["Ausleihe-Nr"] = node.Attributes["id"].Value;
                    dr["Spiel"] = (new ListItem(node.SelectSingleNode("game").InnerText, node.Attributes["id"].Value));
                    dr["Beginn der Ausleihe"] = (new ListItem(node.SelectSingleNode("rentalDate").InnerText, node.Attributes["id"].Value));
                    dr["Ende der Ausleihe"] = (new ListItem(node.SelectSingleNode("returnDate").InnerText, node.Attributes["id"].Value));
                    dt.Rows.Add(dr);
                    dr = dt.NewRow();
                }
            }

            ViewState["CurrentTable"] = dt;
            GridViewRentals.DataSource = dt;
            GridViewRentals.DataBind();
        }

        protected void showRentalHistoryGridView()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("Ausleihe-Nr", typeof(string)));
            dt.Columns.Add(new DataColumn("Spiel", typeof(string)));
            dt.Columns.Add(new DataColumn("Beginn der Ausleihe", typeof(string)));
            dt.Columns.Add(new DataColumn("Ende der Ausleihe", typeof(string)));

            var xmlPath = System.Web.HttpContext.Current.Request.MapPath("~\\xmlResources\\xmlFiles\\") + "rentals.xml";
            XmlDocument xDocument = new XmlDocument();
            xDocument.Load(xmlPath);

            foreach (XmlNode node in xDocument.GetElementsByTagName("Rental"))
            {
                if ((new ListItem(node.SelectSingleNode("user").InnerText, node.Attributes["id"].Value)).ToString() == Context.User.Identity.Name.ToString() && (new ListItem(node.SelectSingleNode("active").InnerText, node.Attributes["id"].Value)).ToString() != "true")
                {
                    dr = dt.NewRow();
                    dr["Ausleihe-Nr"] = node.Attributes["id"].Value;
                    dr["Spiel"] = (new ListItem(node.SelectSingleNode("game").InnerText, node.Attributes["id"].Value));
                    dr["Beginn der Ausleihe"] = (new ListItem(node.SelectSingleNode("rentalDate").InnerText, node.Attributes["id"].Value));
                    dr["Ende der Ausleihe"] = (new ListItem(node.SelectSingleNode("returnDate").InnerText, node.Attributes["id"].Value));
                    dt.Rows.Add(dr);
                    dr = dt.NewRow();
                }
            }

            ViewState["CurrentTable"] = dt;
            GridViewRentalHistory.DataSource = dt;
            GridViewRentalHistory.DataBind();
        }

        protected void GridViewRentals_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridViewRentals.Rows[index];
                string rentalId = selectedRow.Cells[1].Text;

                var xmlPath = System.Web.HttpContext.Current.Request.MapPath("~\\xmlResources\\xmlFiles\\") + "rentals.xml";
                XmlDocument xDocument = new XmlDocument();
                xDocument.Load(xmlPath);

                foreach (XmlNode node in xDocument.GetElementsByTagName("Rental"))
                {
                    if (node.Attributes["id"].Value.ToString() == rentalId)
                    {
                        DateTime returnDate = Convert.ToDateTime(node.SelectSingleNode("returnDate").InnerText);
                        DateTime startDate = Convert.ToDateTime(node.SelectSingleNode("rentalDate").InnerText);
                        DateTime startDateAndOneMonth = startDate.AddMonths(1);
                        if (startDateAndOneMonth.AddDays(14) > returnDate)
                        {
                            returnDate = returnDate.AddDays(7);
                            node.SelectSingleNode("returnDate").InnerText = returnDate.ToString("d");
                            xDocument.Save(xmlPath);
                            Response.Redirect("Rentals");
                        }
                        else
                        {
                            ErrorLabel.Text = "Diese Ausleihe kann nicht mehr verlängert werden";
                        }
                    }

                }
            }
        }
    }
}