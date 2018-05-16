<cfscript>
	param name="id" type="string" default="";

	varError = "";
	cfcClient = new cfcs.cfcClient();

	if (isDefined("form.id")) {
		onFormSubmit(form);
	}

	if (len(trim(id))) {
		qryClient = cfcClient.getClient(id);
	} else {
		qryClients = cfcClient.getClients();
	}

	if (len(trim(id))) {
		cfmodule(template="/views/client-detail.cfm", qryClient=qryClient, varError=varError);
	} else {
		cfmodule(template="/views/client-list.cfm", qryClients=qryClients);
	}

	private void function onFormSubmit(required struct form) {
		upsertSuccess = cfcClient.upsertClient(form);

		if (upsertSuccess eq "true") {
			location(url="/clients/?success=1", addToken=request.addToken);
		} else {
			varError = upsertSuccess;
		}
	}
</cfscript>