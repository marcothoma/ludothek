using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.Xml;
using System.Data;
using System.Web.UI.WebControls;

namespace ludothek.xmlResources.xmlClasses
{
    public class xmlRentals
    {
        public void addRental(String game, String user, String rentalDate, String returnDate)
        {
            var path = System.Web.HttpContext.Current.Request.MapPath("~\\xmlResources\\xmlFiles\\") + "rentals.xml";
            DateTime date = DateTime.Today;
            XDocument doc = XDocument.Load(path);
            var maxId = 0;
            try
            {
                maxId = doc.Root.Elements("Rental")
               .Max(c => (int)c.Attribute("id"));
            }
            catch
            {
                maxId = 0;
            }

            XElement rental = new XElement("Rental",
                new XAttribute("id", maxId + 1),
                new XElement("game", game.Substring(0, game.IndexOf(" /"))),
                new XElement("rentalDate", rentalDate),
                new XElement("returnDate", returnDate),
                new XElement("active", "true"),
                new XElement("user", user));
            doc.Root.Add(rental);
            doc.Save(path);

            // Das Spiel auf ausgeliehen setzen
            var xmlPath = System.Web.HttpContext.Current.Request.MapPath("~\\xmlResources\\xmlFiles\\") + "games.xml";
            XmlDocument xDocument = new XmlDocument();
            xDocument.Load(xmlPath);
            string gameInput = game.Substring(0, game.IndexOf(" /")).ToString();
            foreach (XmlNode node in xDocument.GetElementsByTagName("game"))
            {
                if (node.SelectSingleNode("name").InnerText == gameInput)
                {
                    node.SelectSingleNode("isInLendOut").InnerText = "true";
                }
            }
            xDocument.Save(xmlPath);


        }
    }
}