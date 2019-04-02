using HTML5RecorderApp.Models;
using System;
using System.Web;
using System.Web.UI;

namespace HTML5RecorderApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpPostedFile file = null;
            if (Request.Files.Count > 0)
            {
                file = Request.Files[0];
                var nodes = file.FileName.Split(':');
                var fileName = nodes[0] + "_" + nodes[1] + "_" + nodes[2] + ".wav";
                file.SaveAs(Server.MapPath("~/Resources/" + fileName));
                StoreDataBase(fileName);
            }
        }

        private void StoreDataBase(string fileName)
        {
            var repo = new Repository();
            var succes = repo.SaveFileToDb(fileName);
        }
    }
}