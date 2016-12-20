using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

namespace ludothek.xmlResources.xmlClasses
{
    public static class updateFlags
    {
        public static void updateRentalsXmlActiveFlag()
        {
            var xmlPath = System.Web.HttpContext.Current.Request.MapPath("~\\xmlResources\\xmlFiles\\") + "rentals.xml";
            XmlDocument xDocument = new XmlDocument();
            xDocument.Load(xmlPath);

            foreach (XmlElement xmlElement in xDocument.DocumentElement.SelectNodes("Rental"))
            {
                var returnDate = DateTime.Parse(xmlElement.SelectSingleNode("returnDate").InnerText);
                var dateCompareResult = DateTime.Compare(returnDate, DateTime.Now);
                if (dateCompareResult < 0)
                {
                    xmlElement.SelectSingleNode("active").InnerText = "false";
                }
            }
            xDocument.Save(xmlPath);
        }

        public static void updateIsInLendOutFlag()
        {
            var rentalsXmlPath = System.Web.HttpContext.Current.Request.MapPath("~\\xmlResources\\xmlFiles\\") + "rentals.xml";
            var gamesXmlPath = System.Web.HttpContext.Current.Request.MapPath("~\\xmlResources\\xmlFiles\\") + "games.xml";
            XmlDocument rentalsXml = new XmlDocument();
            XmlDocument gamesXml = new XmlDocument();
            rentalsXml.Load(rentalsXmlPath);
            gamesXml.Load(gamesXmlPath);

            foreach (XmlElement gamesXmlElement in gamesXml.DocumentElement.SelectNodes("game"))
            {
                var currentGameName = gamesXmlElement.SelectSingleNode("name").InnerText;
                if (rentalsXml.DocumentElement.SelectSingleNode("(/RentalList/Rental/*[contains(., '" + currentGameName + "')])[last()]/../active") == null) {
                    gamesXmlElement.SelectSingleNode("isInLendOut").InnerText = "false";
                }
                else
                {
                    if (rentalsXml.DocumentElement.SelectSingleNode("(/RentalList/Rental/*[contains(., '" + currentGameName + "')])[last()]/../active").InnerText == "false")
                    {
                        gamesXmlElement.SelectSingleNode("isInLendOut").InnerText = "false";
                    }
                }
                
            }
            rentalsXml.Save(rentalsXmlPath);
            gamesXml.Save(gamesXmlPath);
        }
    }
}