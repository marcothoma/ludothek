using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using ludothek.xmlResources.xmlClasses;

namespace ludothek.Rental
{
    public partial class CreateRental : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.Name.ToString() == "")
            {
                Response.Redirect("AccessDenied.aspx");
            }
            
            updateFlags.updateRentalsXmlActiveFlag();
            updateFlags.updateIsInLendOutFlag();

            if (GameOne.Items.Count == 0)
            {
                xmlGames.setListBoxValues(ref GameOne);
            }

            DateTime currentDate = DateTime.Now;
            AusleiheBeginn.Text = currentDate.ToString("dd-MM-yyyy");
            AusleiheEnde.Text = currentDate.AddMonths(1).ToString("dd-MM-yyyy");
        }

        protected void newRentalButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                xmlRentals rental = new xmlRentals();
                rental.addRental(GameOne.SelectedItem.ToString(), Context.User.Identity.Name.ToString(), AusleiheBeginn.Text, AusleiheEnde.Text);
                Response.Redirect("Rentals");
            }
            else
            {
                FreeGame.ErrorMessage = "Das Spiel " + GameOne.SelectedItem.ToString() + " kann nicht ausgeliehen werden";
            }
        }

        protected void FreeGame_ServerValidate(object source, ServerValidateEventArgs args)
        {

            args.IsValid = false;
            // Existiert das ausgewählte spiel?
            XmlDocument xDocument = new XmlDocument();
            xDocument.Load(System.Web.HttpContext.Current.Request.MapPath("~\\xmlResources\\xmlFiles\\") + "games.xml");
            string gameInput = GameOne.SelectedItem.ToString().Substring(0, GameOne.SelectedItem.ToString().IndexOf(" /"));
            foreach (XmlNode node in xDocument.GetElementsByTagName("game"))
            {
                if (node.SelectSingleNode("name").InnerText == gameInput)
                {
                    args.IsValid = true;
                }
            }

        }
    }
}