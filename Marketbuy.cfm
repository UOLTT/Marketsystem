<!DOCTYPE html>

<html>

<head>

  <meta charset="utf-8">
  <title>Market Buy Sheet</title> <!--- this page posts to the database table buyrep in the database --->
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
        <a href="allposts">All Posts</a>
      </li>

    </ul>

  </header>

  <section class="outer">

    <section class="inner">

      <div class="articleHeader">

        <h2 class="articleTitle">Reporting Item bought from the market</h2>

      </div>
    </section>

    <section class="inner">

      <div class="articleHeader">

        <h2 class="articleTitle"></h2>

      </div>

<cfoutput>
	<cfquery name="get_mem_names" datasource="#session.maindsn#"> <!--- getting the user name, if they are logged in this can be replaced --->
				SELECT *
				FROM lttname
				ORDER BY sc1
				asc
	</cfquery>
	<cfquery name="get_com" datasource="#session.maindsn#"> <!--- Getting the commoditys list --->
				SELECT *
				FROM commodity
				ORDER BY comname
				asc
	</cfquery>
	<cfquery name="get_shop" datasource="#session.maindsn#"> <!--- getting the list of shops --->
				SELECT *
				FROM shops
				ORDER BY shopname
				asc
	</cfquery>
	
<div>
<form action="process_marketreport.cfm" method="post"> <!--- using a form because I don't know better --->
<table frame="box" cellspacing="2" cellpadding="2" bgcolor="ffffff">
<tr align="center">
   <td colspan="4" align="center"><font color="FF0000"><font size="+2">Market Data Report Form</font></font></td>
 </tr>
<tr align="center">
<td class="headerblack">Reported by</td> <!--- this is where someone would pick who reported this buy information --->
<td class="headerblack">
    <select name="scmon" required>
	<cfloop query="get_mem_names">
	<option value="#get_mem_names.nameUID#">#get_mem_names.sc1#</option>
	</cfloop>
	</select>
	</td>
</tr>
<tr align="center">
<td class="headerblack">Shop</td> <!--- selecting the shop from a drop down list of shops in the system --->
<td class="headerblack">
<select name="shop" required>
	<cfloop query="get_shop">
	<option value="#get_shop.shopUID#">#get_shop.shopname#</option>
	</cfloop>
	</select>
	</td>
</tr>

<tr align="center">
<td class="headerblack">Commodity</td> <!--- Selecting the commodity from the drop down list --->
<td class="headerblack">
<select name="com" required>
	<cfloop query="get_com">
	<option value="#get_com.comUID#">#get_com.comname#</option>
	</cfloop>
	</select>
	</td>
</tr>
<tr align="center">
<td class="headerblack">Price Per SCU</td> <!--- this where they enter the single SCU price --->
<td class="headerblack"><input type="number" name="price" placeholder="this should be a value per scu" required></td>

</tr>

<input type="hidden" name="noc" value="market"> <!--- this is a lock bit it's hidden from the browser so that people can't bypass this page on my testing site it can probably be removed --->
<tr align="center">
    <td colspan="4" align="center"><input type="submit" name="submit" value="Submit Report"></td> <!--- submit button --->
 </tr>

 </table></form>
</div>

</cfoutput>

<cfset price = '#SafeEncode( '#price#' )#'> <!--- this is a place holder sanitization --->

    </section>

  </section>

</body>

</html>
