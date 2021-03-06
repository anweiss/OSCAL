<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
<!-- 
        Run this stylesheet to replace 'uuid' with an actual uuid.
      Wherever there is an id or uuid, a fresh uuid is added. -->
    
    
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/">
        <!--<xsl:comment expand-text="true"> Modified by conversion XSLT { current-dateTime() } - UUIDs refreshed </xsl:comment>-->
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Removing resource/@id -->
    <xsl:template match="resource/@id | party/@id |
        location/@id | party/@id | resource/@id | diagram/@id | user/@id | component/@id |
        protocol/@id | inventory-item/@id | implemented-requirement/@id | statement/@id | by-component/@id"/>
    
    <!-- Wherever a link or anchor points to a resource, it will point to its UUID -->
    
    <xsl:key name="resource-as-internal-link" match="back-matter/resource" use="'#' || @id"/>
    <xsl:key name="party-link"                match="party"                use="@id"/>
    
    <xsl:template match="
        import[exists(key('resource-as-internal-link',@href))]/@href |
        link[exists(key('resource-as-internal-link',@href))]/@href | a[exists(key('resource-as-internal-link',@href))]/@href">
        <xsl:variable name="target" select="key('resource-as-internal-link',.)"/>
        <xsl:attribute name="href" select="'#' || $target/@uuid"/>
    </xsl:template>
    
    <xsl:template match="party-uuid" expand-text="true">
      <xsl:variable name="target" select="key('party-link',string(.))"/>
        <party-uuid>{ $target/@uuid }</party-uuid>
    </xsl:template>
    
    <xsl:template match="implemented-component">
        <xsl:copy>
            <xsl:attribute name="component-id" select="@uuid"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>