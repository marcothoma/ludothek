namespace ludothek.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RemoveEmailAdress : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.AspNetUsers", "EmailAdress");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AspNetUsers", "EmailAdress", c => c.String());
        }
    }
}
