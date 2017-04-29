<!DOCTYPE html>

<html>

<head>

  <meta charset="utf-8">
  <title>Market Sell Sheet</title>
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
        <a href="development.html">Development</a>
      </li>
      <li class="menuButton">
        <a href="ingame.html">In Game</a>
      </li>
      <li class="menuButton">
        <a href="community.html">Community</a>
      </li>
      <li class="menuButton">
        <a href="forums.html">Forums</a>
      </li>
      <li class="menuButton">
        <a href="updates.html">Game Updates</a>
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

        <h2 class="articleTitle">Data on Item sold to the market</h2>

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
	<cfquery name="get_com" datasource="#session.maindsn#">
				SELECT *
				FROM commodity
				ORDER BY comname
				asc
	</cfquery>
	<cfquery name="get_shop" datasource="#session.maindsn#">
				SELECT *
				FROM shops
				ORDER BY shopname
				asc
	</cfquery>
	
<div>
<form action="process_marketreport.cfm" method="post">
<table frame="box" cellspacing="2" cellpadding="2" bgcolor="ffffff">
<tr align="center">
   <td colspan="4" align="center"><font color="FF0000"><font size="+2">Market Date Report Form</font></font></td>
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
<td class="headerblack">Shop</td>
<td class="headerblack">
<select name="shop" required>
	<cfloop query="get_shop">
	<option value="#get_shop.shopUID#">#get_shop.shopname#</option>
	</cfloop>
	</select>
	</td>
</tr>

<tr align="center">
<td class="headerblack">Commodity</td>
<td class="headerblack">
<select name="com" required>
	<cfloop query="get_com">
	<option value="#get_com.comUID#">#get_com.comname#</option>
	</cfloop>
	</select>
	</td>
</tr>
<tr align="center">
<td class="headerblack">Price Per SCU</td>
<td class="headerblack"><input type="number" name="price" placeholder="this should be a value per scu" required></td>

</tr>

<input type="hidden" name="noc" value="market">
<tr align="center">
    <td colspan="4" align="center"><input type="submit" name="submit" value="Submit Report"></td>
 </tr>

 </table></form>
</div>

</cfoutput>



    </section>

  </section>

</body>

</html>
