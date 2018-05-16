<cftry>
  <cfquery name="qCreateInvUsers" datasource="#request.dsn#">
		create table inv_users ( id varchar(250), name varchar(250), password varchar(25) )
  </cfquery>
<cfcatch>
  <p>
    qCreateInvUsers failed.<br>
    <cfdump var="#cfcatch#">
  </p>
  <cfabort>
</cfcatch>
</cftry>

<cftry>
  <cfquery name="qPopInvUsers" datasource="#request.dsn#">
		insert into inv_users ( id, name, password ) values ( '#CreateUUID()#', 'Sally Williams', 'pa55W0rd_' )
  </cfquery>
<cfcatch>
  <p>
    qPopInvUsers failed.<br>
    <cfdump var="#cfcatch#">
  </p>
  <cfabort>
</cfcatch>
</cftry>

<cftry>
  <cfquery name="qGetUsers" datasource="#request.dsn#">
		select * from inv_users
  </cfquery>
<cfcatch>
  <p>
    qGetUsers failed.<br>
    <cfdump var="#cfcatch#">
  </p>
  <cfabort>
</cfcatch>
</cftry>

<p>
  inv_users data:<br>
  <cfdump var="#qGetUsers#">
</p>

		
<cftry>
  <cfquery name="qCreateInvClients" datasource="#request.dsn#">
		create table inv_clients ( 
			id varchar(250), 
			name varchar(250), 
			contact varchar(250),
			email varchar(250),
			phone varchar(25)
		)
  </cfquery>
<cfcatch>
  <p>
    qCreateInvClients failed.<br>
    <cfdump var="#cfcatch#">
  </p>
  <cfabort>
</cfcatch>
</cftry>

<cftry>
  <cfquery name="qPopInvClients" datasource="#request.dsn#">
		insert into inv_clients 
			( id, name, contact, email, phone ) 
		values 
			( '#CreateUUID()#', 'ACME Industries', 'Bob Smith', 'bob@acme.com', '321.321.3211' ) */
  </cfquery>

  <cfquery name="qPopInvClients" datasource="#request.dsn#">
		insert into inv_clients 
			( id, name, contact, email, phone ) 
		values 
			( '#CreateUUID()#', 'Pizza Town', 'Amy Smith', 'amy@pizzatown.com', '123.123.1234' ) */
  </cfquery>

  <cfquery name="qPopInvClients" datasource="#request.dsn#">
		insert into inv_clients 
			( id, name, contact, email, phone ) 
		values 
			( '#CreateUUID()#', 'Big Time Window Cleaning', 'Jamie Smith', 'jamie@bigtime.com', '456.456.4566' ) */
  </cfquery>
<cfcatch>
  <p>
    qPopInvClients failed.<br>
    <cfdump var="#cfcatch#">
  </p>
  <cfabort>
</cfcatch>
</cftry>

<cftry>
  <cfquery name="qGetClients" datasource="#request.dsn#">
		select * from inv_clients
  </cfquery>
<cfcatch>
  <p>
    qGetClients failed.<br>
    <cfdump var="#cfcatch#">
  </p>
  <cfabort>
</cfcatch>
</cftry>

<p>
  inv_clients data:<br>
  <cfdump var="#qGetClients#">
</p>
