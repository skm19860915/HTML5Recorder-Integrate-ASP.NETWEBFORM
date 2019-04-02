using System.Configuration;
using System.Data.SqlClient;

namespace HTML5RecorderApp.Models
{
    public class Repository
    {
        private string _connectionString;

        public Repository()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        }

        internal bool SaveFileToDb(string str)
        {
            var queryString = "insert into dbo.RecorderFiles (FileName) values (@FileName)";
            using (var connection = new SqlConnection(_connectionString))
            {
                var command = new SqlCommand(queryString, connection);
                connection.Open();
                try
                {
                    command.Parameters.AddWithValue("@FileName", str);
                    int id = command.ExecuteNonQuery();
                    if (id > 0)
                        return true;
                    return false;
                }
                catch
                {
                    return false;
                }
            }
        }
    }
}