using MySql.Data.MySqlClient;

namespace pizza_ordering_app
{
    public static class DatabaseHelper
    {
        //private static readonly string ConnectionString = 
        //    "server=localhost;user id=root;password=;database=pizza_app;";
        private static readonly string ConnectionString =
            "";


        public static MySqlConnection GetConnection()
        {
            return new MySqlConnection(ConnectionString);
        }

        public static MySqlCommand CreateCommand(string query, MySqlConnection connection)
        {
            return new MySqlCommand(query, connection);
        }
    }
}