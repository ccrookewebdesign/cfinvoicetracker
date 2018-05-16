<cfscript>
  param name="attributes.successMessage" default="";
  
  if (thisTag.executionMode eq "start") {
    writeOutput('<span class="success mb25">#attributes.successMessage#</span>');
  }
</cfscript>