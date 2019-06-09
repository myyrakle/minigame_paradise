package classes;

import java.sql.*;

public class DBController
{
    private static final String db_username = "admin";
    private static final String db_password = "1234";
    private static final String dbname = "minigames";

    private Connection connection;
    private boolean is_connected=false;

    public DBController()
    {}

    public void connect()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbname + "?useSSL=false&useUnicode=true&characterEncoding=utf8", db_username, db_password);
            is_connected = true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    public void disconnect()
    {
        try
        {
            if(is_connected)
            {
                connection.close();
                is_connected = false;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            is_connected=true;
        }
    }

    public boolean isConnected()
    {
        return is_connected;
    }

    public PreparedStatement getPreparedStatement(String sql)
    {
        try
        {
            if (isConnected())
                return connection.prepareStatement(sql);
            else
                return null;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }

    public void commit()
    {
        if(is_connected)
        {
            try
            {
                connection.commit();
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
    }
}
