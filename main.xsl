<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="body">
    <body>
      <nav>
        <div class="container">
          <h2>RPG Rules</h2>
        </div>
        <div>
          <xsl:apply-templates select="//div[@class='container']" mode="toc"/>
        </div>
      </nav>
      <xsl:apply-templates/>
    </body>
  </xsl:template>

  <xsl:template match="d100"><em>d100</em></xsl:template>
  <xsl:template match="d10"><em>d10</em></xsl:template>
  <xsl:template match="d6"><em>d6</em></xsl:template>
  <xsl:template match="d5"><em>d5</em></xsl:template>
  <xsl:template match="n0"><em>0</em></xsl:template>
  <xsl:template match="n1"><em>1</em></xsl:template>
  <xsl:template match="n2"><em>2</em></xsl:template>
  <xsl:template match="n3"><em>3</em></xsl:template>
  <xsl:template match="n7"><em>7</em></xsl:template>
  <xsl:template match="n10"><em>10</em></xsl:template>

  <xsl:template match="div" mode="toc">
    <xsl:for-each select="h1">
      <xsl:element name="a">
        <xsl:attribute name="href">
          <xsl:text>#</xsl:text>
          <xsl:value-of select="@id"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </xsl:element>
      <xsl:for-each select="../h3">
        <xsl:element name="a">
          <xsl:attribute name="class">
            <xsl:text>indent</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="href">
            <xsl:text>#</xsl:text>
            <xsl:value-of select="@id"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </xsl:element>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>