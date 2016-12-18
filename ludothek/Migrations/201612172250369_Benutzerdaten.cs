namespace ludothek.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Benutzerdaten : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "Name", c => c.String());
            AddColumn("dbo.AspNetUsers", "Vorname", c => c.String());
            AddColumn("dbo.AspNetUsers", "Telefon", c => c.String());
            AddColumn("dbo.AspNetUsers", "EmailAdress", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "EmailAdress");
            DropColumn("dbo.AspNetUsers", "Telefon");
            DropColumn("dbo.AspNetUsers", "Vorname");
            DropColumn("dbo.AspNetUsers", "Name");
        }
    }
}
