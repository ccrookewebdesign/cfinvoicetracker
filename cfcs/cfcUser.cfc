component displayName="user" {    

  public boolean function loginUser(required string password="")  
    description="Log in the user" {

    if (!len(trim(arguments.password))) {
      return false;
    }

    qLoginUser = loginUserQuery(arguments.password);

    if (qLoginUser.recordcount) {
      setUserSession(qLoginUser);
      return true;
    } else {
      return false;
    }

  }

  public void function logoutUser() 
    description="Logout user" {
      
    clearUserSession();
  
  }

  private query function loginUserQuery(required string pwd)
    description="boilerplate for login query" {

    objLoginUser = new Query(datasource="#request.dsn#");    
    
    objLoginUser.setSQL("
      SELECT u.id, u.name
      FROM inv_users u
      WHERE u.password =  :password
    ");
    
    objLoginUser.addParam(name="password",value="#trim(arguments.pwd)#",CFSQLTYPE="CF_SQL_STRING");

    return objLoginUser.execute().getResult();
  }

  private void function setUserSession(required query user) 
    description="Assigns passed in values to user session structure" {
    
    session.user.id = user.id;
    session.user.name = user.name;
  
  }

  private void function clearUserSession() 
    description="Clears values from user session structure" {
  
    session.user.id = "";
    session.user.name = "";
  
  }
}