package classes;

import java.sql.*;

public class RankBean
{
    public static void setScore(String gamename, String username, int score)
    {
        var db = new DBController();
        db.connect();

        try
        {
            var statement = db.getPreparedStatement("insert into "+gamename+"_rank(username, score) values(?,?)");
            statement.setString(1, username);
            statement.setInt(2, score);
            statement.executeUpdate();
            db.commit();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            db.disconnect();
        }
    }

    public static ResultSet getRank(String gamename)
    {
        var db = new DBController();

        db.connect();

        try
        {
            var statement = db.getPreparedStatement("select * from "+gamename+"_rank "+"order by score");
            return statement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
        finally
        {
            db.disconnect();
        }
    }

    public static String getTop10Table(String gamename)
    {
        var db = new DBController();

        db.connect();

        StringBuffer table = new StringBuffer(2024);

        try
        {
            var statement = db.getPreparedStatement("select * from "+gamename+"_rank "+"order by score desc limit 10");
            var resultSet = statement.executeQuery();

            int count = 0;
            while(resultSet.next())
            {
                count++;
                table.append("<tr>")
                     .append("<td>").append(count).append("</td> ")
                     .append("<td>").append(resultSet.getInt("score")).append("</td> ")
                     .append("<td>").append(resultSet.getString("username")).append("</td> ")
                     .append("</tr>\n");
            }

            while(count<10)
            {
                count++;
                table.append("<tr>")
                     .append("<td>").append(count).append("</td> ")
                     .append("<td>").append("-").append("</td> ")
                     .append("<td>").append("-").append("</td> ")
                     .append("</tr>\n");
            }
            return table.toString();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return table.toString();
        }
        finally
        {
            db.disconnect();
        }
    }

    public static String getAllTable(String gamename)
    {
        var db = new DBController();

        db.connect();

        StringBuffer table = new StringBuffer(2024);

        try
        {
            var statement = db.getPreparedStatement("select * from "+gamename+"_rank "+"order by score desc");
            var resultSet = statement.executeQuery();

            int count = 0;

            while(resultSet.next())
            {
                count++;
                table.append("<tr>")
                        .append("<td>").append(count).append("</td> ")
                        .append("<td>").append(resultSet.getString("username")).append("</td> ")
                        .append("<td>").append(resultSet.getInt("score")).append("</td> ")
                        .append("</tr>\n");
            }

            return table.toString();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return table.toString();
        }
        finally
        {
            db.disconnect();
        }
    }
}
