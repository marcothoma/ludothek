using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.Xml;
using System.Data;
using System.Web.UI.WebControls;

namespace M133_Pfister_Tim.XML_Helpers
{
    public class LendOut
    {
        public void addLendOut(String game, String user)
        {
            var path = System.Web.HttpContext.Current.Request.MapPath("~\\XML\\") + "LendOut.xml";
            DateTime date = DateTime.Today;
            XDocument doc = XDocument.Load(path);
            var maxId = 0;
            try
            {
                maxId = doc.Root.Elements("LendOut")
               .Max(c => (int)c.Attribute("id"));
            }
            catch
            {
                maxId = 0;
            }

            XElement restaurant = new XElement("LendOut",
                new XAttribute("id", maxId + 1),
                new XElement("game", game.Substring(0, game.IndexOf(" /"))),
                new XElement("lendOutDate", date.ToString("d")),
                new XElement("returnDate", date.AddDays(7).ToString("d")),
                new XElement("active", "true"),
                new XElement("user", user));
            doc.Root.Add(restaurant);
            doc.Save(path);

            // Das Spiel auf ausgeliehen setzen
            var xmlPath = System.Web.HttpContext.Current.Request.MapPath("~\\XML\\") + "games.xml";
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

        public static DataTable getNonActiveLendOuts(String user)
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("Ausleihe ID", typeof(string)));
            dt.Columns.Add(new DataColumn("Spiel", typeof(string)));
            dt.Columns.Add(new DataColumn("Ausleihedatum", typeof(string)));
            dt.Columns.Add(new DataColumn("Rückgabedatum", typeof(string)));
            dt.Columns.Add(new DataColumn("Benutzer", typeof(string)));

            var xmlPath = System.Web.HttpContext.Current.Request.MapPath("~\\XML\\") + "LendOut.xml";
            XmlDocument xDocument = new XmlDocument();
            xDocument.Load(xmlPath);

            foreach (XmlNode node in xDocument.GetElementsByTagName("LendOut"))
            {
                if ((new ListItem(node.SelectSingleNode("user").InnerText, node.Attributes["id"].Value)).ToString() == user && (new ListItem(node.SelectSingleNode("active").InnerText, node.Attributes["id"].Value)).ToString() != "true")
                {
                    dr = dt.NewRow();
                    dr["Ausleihe ID"] = node.Attributes["id"].Value;
                    dr["Spiel"] = (new ListItem(node.SelectSingleNode("game").InnerText, node.Attributes["id"].Value));
                    dr["Ausleihedatum"] = (new ListItem(node.SelectSingleNode("lendOutDate").InnerText, node.Attributes["id"].Value));
                    dr["Rückgabedatum"] = (new ListItem(node.SelectSingleNode("returnDate").InnerText, node.Attributes["id"].Value));
                    dr["Benutzer"] = (new ListItem(node.SelectSingleNode("user").InnerText, node.Attributes["id"].Value));
                    dt.Rows.Add(dr);
                    dr = dt.NewRow();
                }
            }

            return dt;
        }


    }
}