<!DOCTYPE html>

<html>

<head>

  <meta charset="utf-8">
  <title>Market Data</title>
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
        <a href="viewmarket.cfm">View Market Data</a>
      </li>
      <li class="menuButton">
        <a href="allposts">All Posts</a>
      </li>

    </ul>

  </header>

  <section class="outer">

    <section class="inner">

      <div class="articleHeader">

        <h2 class="articleTitle">Market Data View</h2>

      </div>
    </section>

    <section class="inner">

      <div class="articleHeader">

        <h2 class="articleTitle"></h2>

      </div>

<cfoutput>
  <cfquery name="get_com" datasource="#session.maindsn#"> <!--- Getting the commoditys list --->
				SELECT *
				FROM commodity
				ORDER BY comname
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

	
<div>
<table frame="box" cellspacing="2" cellpadding="2" bgcolor="ffffff">
<tr align="center">
   <td colspan="4" align="center"><font color="FF0000"><font size="+2">Market Data</font></font></td>
 </tr>
 
 <tr align="center">
<td class="headerblack">pick a power</td>
<td class="headerblack">
    <select name="pow" required>
	<cfloop query="get_gal">
	<option value="#get_gal.galpowersUID#">#get_gal.powername#</option>
	</cfloop>
	</select>
	</td>
</tr>
 
 	<cfquery name="get_location" datasource="#session.maindsn#">
				SELECT *
				FROM locations
        WHERE galpower ='#pow#'
				ORDER BY location
				asc
	</cfquery>
 
<tr align="center">
<td class="headerblack">pick a location</td>
<td class="headerblack">
    <select name="loc" required>
	<cfloop query="get_location">
	<option value="#get_location.locationUID#">#get_location.location#</option>
	</cfloop>
	</select>
	</td>
</tr>

  <cfquery name="get_shop" datasource="#session.maindsn#"> <!--- getting the list of shops based on the location above--->
				SELECT *
				FROM shops
        WHERE location ='#loc#'
				ORDER BY shopname
				asc
	</cfquery>

<tr align="center">
<td class="headerblack">Pick a shop</td> <!--- picking the shop you want information from --->
<td class="headerblack">
<select name="shop" required>
	<cfloop query="get_shop">
	<option value="#get_shop.shopsUID#">#get_shop.shopname#</option>
	</cfloop>
	</select>
	</td>
</tr>

<tr align="center">
<td class="headerblack">commodity</td> <!--- picking the commodity you want data on --->
<td class="headerblack">
<select name="com" required>
	<cfloop query="get_com">
	<option value="#get_com.comUID#">#get_com.comname#</option>
	</cfloop>
	</select>
	</td>
</tr>

  <cfquery name="get_buy" datasource="#session.maindsn#"> <!--- getting the list of buy prices based on the location and commodity above--->
				SELECT *
				FROM buyrep
        WHERE shop ='#shop#' AND  com ='#com#'
				ORDER BY time
				asc
	</cfquery>
  
  <cfquery name="get_sell" datasource="#session.maindsn#"> <!--- getting the list of sell prices based on the location and commodity above--->
				SELECT *
				FROM sellrep
        WHERE shop ='#shop#' AND  com ='#com#'
				ORDER BY time
				asc
	</cfquery>

<tr align="center">
<td class="headerblack">Latest BUY price</td>
<td class="headerblack"></td>  <!--- this should be the latest price --->
</tr>

<tr align="center">
 <td class="headerblack">Latest Sell price</td>
 <td class="headerblack"></td> <!--- this should be the latest price --->
</tr>

<!--- Graph of historical price data not sure how to mock up a display for this --->



 </table>
</div>


</cfoutput>



    </section>

  </section>

</body>

</html>
