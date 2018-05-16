<cfscript>
  param name="redirectPage" default="/";

  cfcUser = new cfcs.cfcUser();
  cfcUser.logoutUser();
 
  location( url="#redirectPage#", addToken="#request.addToken#" );
</cfscript>