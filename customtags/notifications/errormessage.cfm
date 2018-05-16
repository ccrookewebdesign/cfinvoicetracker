<cfscript>
  param name="attributes.errorMessage" default="";
  
  if (thisTag.executionMode eq "start") {
    writeOutput('<span class="error">#attributes.errorMessage#</span>');
  }
</cfscript>