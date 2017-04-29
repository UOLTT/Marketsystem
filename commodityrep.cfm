<!DOCTYPE html>

<html>

<head>

  <meta charset="utf-8">
  <title>Commodity Reporting</title>
  <link rel="stylesheet" href="styles\stylesheet.css">

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
        <a href="allposts">All Posts</a>
      </li>

    </ul>

  </header>

  <section class="outer">

    <section class="inner">

      <div class="articleHeader">

        <h2 class="articleTitle">Reporting a new Commodity</h2>

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

	
<div>
<form action="process_marketreport.cfm" method="post"> <!--- yup still forms --->
<table frame="box" cellspacing="2" cellpadding="2" bgcolor="ffffff">
<tr align="center">
   <td colspan="4" align="center"><font color="FF0000"><font size="+2">Commodity Reporting Form</font></font></td>
 </tr>
<tr align="center">
<td class="headerblack">Reported by</td> <!--- not used in the table currently --->
<td class="headerblack">
    <select name="scmon" required>
	<cfloop query="get_mem_names">
	<option value="#get_mem_names.nameUID#">#get_mem_names.sc1#</option>
	</cfloop>
	</select>
	</td>
</tr>

<tr align="center">
 <td class="headerblack">Commodity Name</td>
 <td class="headerblack"><input name="comname" placeholder="Name of the Commodity" required></td>
</tr>

<tr align="center">
 <td class="headerblack">Commodity Description</td>
 <td class="headerblack"><input name="comdesc" placeholder="Describe it, gas, metal, ect" required></td>
</tr>

<tr align="center">
 <td class="headerblack">Commodity Mass per SCU</td>
 <td class="headerblack"><input type="number" name="commass" placeholder="what is the mass of one SCU" required></td>
</tr>

<tr align="center">
    <td colspan="4" align="center"><input type="submit" name="submit" value="Submit Report"></td>
 </tr>

 </table></form>
</div>

</cfoutput>

<cfset commass = '#SafeEncode( '#commass#' )#'> <!--- this is my sanitization call. I know this function may not be in our build but place holder --->
<cfset comname = '#SafeEncode( '#comname#' )#'> <!--- place holder sanitzation --->
<cfset comdesc = '#SafeEncode( '#comdesc#' )#'> <!--- place holder sanitzation --->

    </section>

  </section>

</body>

</html>
