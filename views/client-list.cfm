<cfscript>
  cfimport(taglib="/customTags/template", prefix="layout");
  
  param name="attributes.qryClients" type="query" default=QueryNew("id, name, contact, email, phone", "varchar, varchar, varchar, varchar, varchar");
  
  clients = attributes.qryClients;
</cfscript>

<layout:template section="home" pageTitle="Clients">

<p>
	These are the Clients
</p>

<cfscript>
	if (isdefined("url.success")) {
		cfimport(taglib="/customTags/notifications", prefix="success");
    success:successmessage(successMessage="Record successfully updated");
	}
</cfscript>		

<div class="table-responsive">
	<table class="table table-striped table-sm">
	<thead>
		<tr>
			<th>Client</th>
			<th>Contact</th>
			<th>Email</th>
			<th>Phone</th>
		</tr>
	</thead>
	<tbody>
		<cfoutput query="clients">
			<tr>
				<td><a href="?id=#clients.id#">#clients.name#</a></td>
				<td>#clients.contact#</td>
				<td>#clients.email#</td>
				<td>#clients.phone#</td>
			</tr>
		</cfoutput>
		</tbody>
	</table>
</div>

</layout:template>