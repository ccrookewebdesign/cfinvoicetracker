<cfscript>
  cfimport(taglib="/customTags/template", prefix="layout");
  
  param name="attributes.varError" type="string" default="";
  param name="attributes.qryClient" type="query" default=QueryNew("id, name, contact, email, phone", "varchar, varchar, varchar, varchar, varchar");

  qryClient = attributes.qryClient;
</cfscript>

<layout:template section="home" pageTitle="Client: #qryClient.name#">

<p>
	Client detail information
</p>

<div class="row" style="margin-top: 35px;">
  <div class="col-md-12 col-sm-12">
    <cfscript>
      if (len(trim(attributes.varError))) {
        cfimport(taglib="/customTags/notifications", prefix="err");
        err:errormessage(errorMessage="#attributes.varError#");
      }
    </cfscript>
  </div>
</div>

<div class="row" style="margin-top: 35px;">
  <div class="col-md-7 col-sm-12">
    <cfscript>
      cfmodule(template="client-detail-form.cfm", qryClient=qryClient);
    </cfscript>
  </div>
  <div class="col-md-5 col-sm-12">
    
  </div>
</div>

</layout:template>