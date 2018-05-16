<cfif thisTag.executionMode eq "start">
	<cfparam name="attributes.section" default="home" />
	<cfparam name="attributes.pageTitle" default="Important Page" />

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sample ColdFusion Invoice Tracker</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="/assets/styles.css">
  </head>

<body>
	<nav class="site-banner">
    <div class="justify-content-between container banner-container">
			<span class="color-light">Invoice Tracker</span>
			<ul class="nav justify-content-end">
				<li class="nav-item">
					<a class="nav-link " href="/logout/">Logout</a>
				</li>
			</ul>		
		</div>
	</nav>
		
	<nav class="site-header">
		<div class="justify-content-between flex-row-reverse container header-container">
			
			<ul class="nav justify-content-end">
			<li class="nav-item">
					<a class="nav-link active" href="/">Dashboard</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/clients/">Clients</a>
				</li>
				<!--
				<li class="nav-item">
					<a class="nav-link" href="#">Invoices</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Tasks</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Expenses</a>
				</li>
				<li class="nav-item">
					<a class="nav-link " href="#">Reports</a>
				</li>	
				-->			
			</ul>		
		</div>
	</nav>
			
	<nav class="breadcrumb-nav">
		<div class="container breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item active" aria-current="page">
					<cfoutput>#dateformat(now(), "dddd, mmm d, yyyy")#&nbsp;&nbsp;&nbsp;#timeformat(now(), "h:mmtt")#</cfoutput>
				</li>
			</ol>
		</div>		
	</nav>
	<div class="container content-container">
		<h3><cfoutput>#attributes.pageTitle#</cfoutput></h3>
<cfelse>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
</cfif>		