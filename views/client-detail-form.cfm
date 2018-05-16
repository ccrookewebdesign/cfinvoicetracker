<cfscript>
  cfimport(taglib="/customTags/template", prefix="layout");
  
  param name="attributes.qryClient" type="query" default=QueryNew("id, name, contact, email, phone", "varchar, varchar, varchar, varchar, varchar");
  qryClient = attributes.qryClient;

  param name="form.id" default=qryClient.id;
  param name="form.name" default=qryClient.name;
  param name="form.contact" default=qryClient.contact;
  param name="form.email" default=qryClient.email;
  param name="form.phone" default=qryClient.phone;
</cfscript>

<cfoutput>
<form action="#cgi.script_name#" method="post">
<input type="hidden" name="id" value="#iif(len(trim(form.id)), de(form.id), de("NEW"))#">
<div class="mb-3">
  <label for="name">Name</label>
  <input name="name" value="#form.name#" type="text" class="form-control" id="name">
  <div class="invalid-feedback">
    Please enter a name.
  </div>
</div>
<div class="mb-3">
  <label for="contact">Contact</label>
  <input name="contact" value="#form.contact#" type="text" class="form-control" id="contact">
  <div class="invalid-feedback">
    Please enter a contact name.
  </div>
</div>
<div class="mb-3">
  <label for="email">Email <span class="text-muted">(Optional)</span></label>
  <input name="email" value="#form.email#" type="email" class="form-control" id="email">
  <div class="invalid-feedback">
    Please enter a valid email address.
  </div>
</div>
<div class="mb-3">
  <label for="phone">Phone</label>
  <input name="phone" value="#form.phone#" type="text" class="form-control" id="phone">
  <div class="invalid-feedback">
    Please enter a phone number.
  </div>
</div>
<button class="btn" type="submit">Save</button>
</form>
</cfoutput>