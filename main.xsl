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
          <h2>
            <xsl:value-of select="//title"/>
          </h2>
        </div>
        <div>
          <xsl:apply-templates select="//div[@class='container']" mode="toc"/>
        </div>
      </nav>
      <xsl:apply-templates/>
    </body>
  </xsl:template>

  <xsl:template match="include">
    <xsl:variable name="x" select="@id"/>
    <xsl:apply-templates select="document('harn-data.xml',node()|@*)//*[@id=$x]"/>
  </xsl:template>

  <xsl:template match="table[not(@class) or @class != 'links']">
    <xsl:element name="table">
      <xsl:apply-templates select="@*" />
      <caption>
        <xsl:text>Table&#160;</xsl:text>
        <xsl:number/>
      </caption>
      <xsl:apply-templates select="tr"/>
    </xsl:element>
  </xsl:template>

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
          <xsl:value-of select="."/>
        </xsl:element>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
