<!DOCTYPE html>

<html>

<head>

  <meta charset="utf-8">
  <title>Location Reporting</title>
  <link rel="stylesheet" href="mainStyle.css">

</head>

<body>

  <header>

    <h1>UOLTT Conglomerate</h1>

    <ul class="menuList">

      <li class="menuButton">
        <a href="index.html">Home</a>
      </li>
      <li class="menuButton">
        <a href="marketsell.cfm">Report a market selling price</a>
      </li>
      <li class="menuButton">
        <a href="marketbuy.cfm">Report a market buy price</a>
      </li>
      <li class="menuButton">
        <a href="locationrep.cfm">Report a new celestial location</a>
      </li>
      <li class="menuButton">
        <a href="shoprep.cfm">Report a new Shop location</a>
      </li>
      <li class="menuButton">
        <a href="commodityrep.cfm">Report a new commodity</a>
      </li>
      <li class="menuButton">
        <a href="faq.html">FAQ</a>
      </li>
      <li class="menuButton">
        <a href="#allposts">All Posts</a>
      </li>

    </ul>

  </header>

  <section class="outer">

    <section class="inner">

      <div class="articleHeader">

        <h2 class="articleTitle">Reporting a new location</h2>

      </div>
    </section>

    <section class="inner">

      <div class="articleHeader">

        <h2 class="articleTitle"></h2>

      </div>

<cfoutput>
	<cfquery name="get_mem_names" datasource="#session.maindsn#">
				SELECT *
				FROM lttname
				ORDER BY sc1
				asc
	</cfquery>
	<cfquery name="get_sys" datasource="#session.maindsn#">
				SELECT *
				FROM systems
				ORDER BY systemname
				asc
	</cfquery>
	<cfquery name="get_gal" datasource="#session.maindsn#">
				SELECT *
				FROM galpowers
				ORDER BY powername
				asc
	</cfquery>
  <cfquery name="get_local" datasource="#session.maindsn#">
				SELECT *
				FROM localaff
				ORDER BY affname
				asc
	</cfquery>
  <cfquery name="get_cel" datasource="#session.maindsn#"> <!--- The info in this call may be wrong for the moment, forgot to download celtype  --->
				SELECT *
				FROM celtype
				ORDER BY celname
				asc
	</cfquery>
	
<div>
<form action="process_marketreport.cfm" method="post"> <!--- yup still forms --->
<table frame="box" cellspacing="2" cellpadding="2" bgcolor="ffffff">
<tr align="center">
   <td colspan="4" align="center"><font color="FF0000"><font size="+2">Location Reporting Form</font></font></td>
 </tr>
<tr align="center">
<td class="headerblack">Reported by</td>
<td class="headerblack">
    <select name="scmon" required>
	<cfloop query="get_mem_names">
	<option value="#get_mem_names.nameUID#">#get_mem_names.sc1#</option>
	</cfloop>
	</select>
	</td>
</tr>

<tr align="center">
<td class="headerblack">System</td>
<td class="headerblack">
<select name="sys" required>
	<cfloop query="get_sys">
	<option value="#get_sys.systemUID#">#get_sys.sysname#</option>
	</cfloop>
	</select>
	</td>
</tr>

<tr align="center">
<td class="headerblack">Galactic Power</td>
<td class="headerblack">
<select name="galpow" required>
	<cfloop query="get_gal">
	<option value="#get_gal.galpowersUID#">#get_gal.powername#</option>
	</cfloop>
	</select>
	</td>
</tr>

<tr align="center">
<td class="headerblack">Local Affiliation</td>
<td class="headerblack">
<select name="aff" required>
	<cfloop query="get_local">
	<option value="#get_local.localaffUID#">#get_local.affname#</option>
	</cfloop>
	</select>
	</td>
</tr>

<tr align="center">
<td class="headerblack">Celestital Type</td> <!--- the info in here might be wrong until I can check the db --->
<td class="headerblack">
<select name="cel" required>
	<cfloop query="get_cel">
	<option value="#get_cel.celUID#">#get_cel.celname#</option>
	</cfloop>
	</select>
	</td>
</tr>

<tr align="center">
 <td class="headerblack">Location Name</td>
 <td class="headerblack"><input name="locname" placeholder="Name of the location" required></td>
</tr>

<tr align="center">
    <td colspan="4" align="center"><input type="submit" name="submit" value="Submit Report"></td>
 </tr>

 </table></form>
</div>

</cfoutput>

<cfset locname = '#SafeEncode( '#locname#' )#'>  <!--- place holder sanitization --->

    </section>

  </section>

</body>

</html>
