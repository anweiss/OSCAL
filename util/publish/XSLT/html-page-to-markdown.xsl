<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  xpath-default-namespace="http://www.w3.org/1999/xhtml"
  version="3.0">
  
<!-- Converts anything into the XHTML namespace and
     thence into Markdown syntax. -->
  
  <xsl:output method="text" indent="no"/>
  
  <xsl:import href="html-to-markdown.xsl"/>
  
  <xsl:variable name="as-xhtml">
    <xsl:apply-templates select="/" mode="as-xhtml"/>
  </xsl:variable>
  
  <xsl:template match="/">
    <xsl:apply-templates mode="md" select="$as-xhtml"/>
  </xsl:template>
  
  <xsl:template match="*" mode="as-xhtml">
    <xsl:element name="{local-name()}" namespace="http://www.w3.org/1999/xhtml">
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="#current"/>
    </xsl:element>
  </xsl:template>
  
</xsl:stylesheet>