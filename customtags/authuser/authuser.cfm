<cfscript>
	param attributes.redirectPage="";

	if (thisTag.executionMode eq "start") {
		if (!len(trim(session.user.id)) and cgi.script_name neq "/login/index.cfm") {
			location(
				url="/login/?redirectPage=#urlencodedformat(attributes.redirectPage)#", 
				addToken="#request.addToken#"
			);
		}
	}
</cfscript>