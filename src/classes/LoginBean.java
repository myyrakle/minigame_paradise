package classes;

import com.mysql.jdbc.*;

import java.sql.SQLException;

/*
* 회원가입용 기능 빈
*
*/

public class LoginBean
{
    private String username = "";
    private String password = "";

    private DBController db;

    public LoginBean(){}
    public LoginBean(String username, String password)
    {
        this.username=username;
        this.password=password;
    }

    public String getUsername()
    {
        return this.username;
    }
    public void setUsername(String username)
    {
        this.username=username;
    }

    public String getPassword()
    {
        return this.password;
    }
    public void setPassword(String password)
    {
        this.password=password;
    }

    public boolean check()
    {
        if(this.username==null || this.password==null) //null 처리
            return false;

        else if(this.username.equals("admin") && this.password.equals("admin1234")) //어드민만 따로 처리
            return true;

        else
        {
            db = new DBController();

            db.connect();

            try
            {
                var statement = db.getPreparedStatement("select password, username from user_table where username=?");
                statement.setString(1, username);
                var result = statement.executeQuery();

                if(result.next())
                {
                    String in_db_password = result.getString("password");


                    if(password.equals(in_db_password)) //비밀번호 맞음
                        return true;
                    else //비밀번호 틀림
                        return false;
                }
                else //아이디 자체가 없음
                    return false;
            }
            catch (SQLException e)
            {
                e.printStackTrace();
                return false;
            }
            finally
            {
                db.disconnect();
            }
        }
    }
}
