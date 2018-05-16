component output="false" hint="application componenet" {
	this.name = 'invoicetracker';
	this.title = 'Invoice Tracker';
	this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0);
	this.sessionManagement = true;
	this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);
	this.sessionCookie.httpOnly = true;
	this.sessionCookie.timeout = '10';
	this.sessionCookie.disableupdate = true;
	
	function onApplicationStart(){
		return true;
	}
	
	function onRequestStart(string targetPage) {
		if(structKeyExists(url, 'reload')) {
			onApplicationStart();
		}

		if (!structKeyExists(session, "user")){
			session.user.id = "";
    	session.user.name = "";
		}

		request.url = "http://localhost:8500/";
		request.dsn = "cfbookclub";
		request.rootDir = GetDirectoryFromPath(ExpandPath("*.*"));
		request.customTags = "customtags";
		request.addToken = false;				

		cfimport(taglib="/customTags/authuser", prefix="auth");
		auth:authuser(redirectPage="#cgi.script_name#");
	}
	
	function onError(any error, string eventName){
		writeDump(error);
		abort;
	}
}