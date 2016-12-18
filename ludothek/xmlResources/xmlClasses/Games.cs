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
    public class Games
    {

        public static void setListBoxValues(ref DropDownList game)
        {
            game.Items.Clear();
            XmlDocument xDocument = new XmlDocument();
            xDocument.Load(System.Web.HttpContext.Current.Request.MapPath("~\\XML\\") + "games.xml");
            String price;
            foreach (XmlNode node in xDocument.GetElementsByTagName("game"))
            {
                if (node.SelectSingleNode("isInLendOut").InnerText == "false")
                {
                    switch(node.SelectSingleNode("priceClass").InnerText)
                    {
                        case "1":
                            price = "CHF 3.-";
                            break;
                        case "2":
                            price = "CHF 6.-";
                            break;
                        case "3":
                            price = "CHF 9.-";
                            break;
                        default:
                            price = "";
                            break;
                    }
                    game.Items.Add(new ListItem(node.SelectSingleNode("name").InnerText + " / " + price ,
                    node.Attributes["id"].Value));
                }
            }
            game.DataValueField = "value";
            game.DataTextField = "text";
            game.DataBind();
        }


    }
}