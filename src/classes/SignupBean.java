package classes;
/*
* 회원가입용 기능 빈
* */

import java.sql.SQLException;

public class SignupBean
{
    private String username;
    private String password;

    public SignupBean()
    {}
    public SignupBean(String username, String password)
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

    //아이디 중복 확인
    public boolean check()
    {
        if(username.equals("admin")) //어드민은 등록불가
            return false;
        else
        {
            DBController db = new DBController();
            db.connect();

            try
            {
                var statement = db.getPreparedStatement("select username from user_table where username=?");
                statement.setString(1, username);
                var result = statement.executeQuery();

                if(result.next()) //뭐라도 있으면 중복
                    return false;
                else //중복아님
                    return true;
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

    //계정을 등록합니다.
    public void register()
    {
        DBController db = new DBController();
        db.connect();

        try
        {
            var statement = db.getPreparedStatement("insert into user_table(username, password) values(?,?)");
            statement.setString(1, username);
            statement.setString(2, password);
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
}
