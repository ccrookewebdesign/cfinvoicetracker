<cfscript>
  param name="attributes.redirectPage" default="";
  param name="attributes.action" default="#cgi.script_name#";
  param name="attributes.buttonText" default="Login";

  varError = "";
</cfscript>

<cfif thisTag.executionMode eq "start">
  <cfscript>
    if (isdefined("form.buttonLogin")) {
      attributes.redirectPage = form.redirectPage;
      attributes.action = form.action;
      attributes.buttonText = form.buttonText;

      if (len(trim(form.password))) {
        cfcUserLogin = new cfcs.cfcUser();

        if (cfcUserLogin.loginUser(form.password)) {
          location(url="#attributes.redirectPage#", addToken="#request.addToken#");
        } else {
          varError = "Login failed";
        }
      } else {
        varError = "Your password, please";
      }
    }    
  </cfscript>
  
  <cfoutput>
  <form class="form-inline" action="#attributes.action#" method="post">
    <input type="hidden" name="redirectPage" value="#attributes.redirectPage#">
    <input type="hidden" name="action" value="#attributes.action#">
    <input type="hidden" name="buttonText" value="#attributes.buttonText#">
    <div class="form-group mx-sm-3 mb-2">
      <label for="inputPassword2" class="sr-only">Password</label>
      <input type="password" name="password" value="pa55W0rd_" class="form-control" placeholder="Password">
    </div>
    <button name="buttonLogin" type="submit" class="btn btn-primary mb-2">#attributes.buttonText#</button>
  </form>
  </cfoutput>

  <cfscript>
    if (len(trim(varError))) {
      cfimport(taglib="/customTags/notifications", prefix="err");
      err:errormessage(errorMessage="#varError#");
    }
  </cfscript>
</cfif>