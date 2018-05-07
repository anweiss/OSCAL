<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0"
    
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/METASCHEMA">
        <xs:schema elementFormDefault="qualified" targetNamespace="http://csrc.nist.gov/ns/oscal/1.0">
            <xs:include schemaLocation="oscal-prose.xsd"/>
            <xsl:apply-templates/>
            <xs:group name="prose">
                <xs:choice>
                    <xs:element ref="oscal:p"/>
                    <xs:element ref="oscal:ul"/>
                    <xs:element ref="oscal:ol"/>
                    <xs:element ref="oscal:pre"/>
                </xs:choice>
            </xs:group>
        </xs:schema>
    </xsl:template>
    
    <xsl:template match="define-component">
        <xs:element name="{@name}">
            <xs:complexType>
                <xs:sequence>
                    <xsl:apply-templates select="* except attribute"/>
                </xs:sequence>
                <xsl:apply-templates select="attribute"/>
                <xsl:apply-templates select="." mode="default-attributes"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="component">
        <xs:element name="{@named}" minOccurs="{ number(@required = 'yes') }">
            <xs:complexType>
                <xs:sequence>
                    <xsl:apply-templates select="* except attribute"/>
                </xs:sequence>
                <xsl:apply-templates select="attribute"/>
                <xsl:apply-templates select="." mode="default-attributes"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="components">
        <xs:element name="{@named}" maxOccurs="unbounded" minOccurs="{ number(@required = 'yes') }">
            <xs:complexType>
                <xs:sequence>
                    <xsl:apply-templates select="* except attribute"/>
                </xs:sequence>
                <xsl:apply-templates select="attribute"/>
                <xsl:apply-templates select="." mode="default-attributes"/>
                
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    
    <xsl:template match="property[matches(@declared-as,'\S')] |
        line[matches(@declared-as,'\S')] |
        part[matches(@declared-as,'\S')] |
        statement[matches(@declared-as,'\S')] |
        feature[matches(@declared-as,'\S')]
        ">
        <xs:element minOccurs="{ number(@required = 'yes') }" ref="oscal:{@declared-as}"/>
    </xsl:template>
    
    <xsl:template match="properties[matches(@declared-as,'\S')] | 
        lines[matches(@declared-as,'\S')] | 
        parts[matches(@declared-as,'\S')] |
        statements[matches(@declared-as,'\S')] |
        features[matches(@declared-as,'\S')]">
        <xs:element maxOccurs="unbounded" minOccurs="{ number(@required = 'yes') }" ref="oscal:{@declared-as}"/>
    </xsl:template>
    
    
    
    <xsl:template match="define-property">
        <xs:element name="{@name }">
            <xs:complexType mixed="true">
                <!-- picking up attribute declarations -->
                <xsl:apply-templates/>
                <xsl:apply-templates select="." mode="default-attributes"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="property">
        <xs:element name="{@named}" minOccurs="{ number(@required = 'yes') }">
            <xs:complexType mixed="true">
                <!-- picking up attribute declarations -->
                <xsl:apply-templates/>
                <xsl:apply-templates select="." mode="default-attributes"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
   <xsl:template match="properties">
        <xs:element name="{@named}" maxOccurs="unbounded" minOccurs="{ number(@required = 'yes') }">
            <xs:complexType mixed="true">
                <!-- picking up attribute declarations -->
                <xsl:apply-templates/>
                <xsl:apply-templates select="." mode="default-attributes"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="define-line">
        <xs:element name="{@name}">
            <xs:complexType mixed="true">
                <xs:group ref="oscal:everything-inline"/>
                <xsl:apply-templates/>
                <xsl:apply-templates select="." mode="default-attributes"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="line">
        <xs:element name="{@named}" minOccurs="{ number(@required = 'yes') }">
            <xs:complexType mixed="true">
                <xs:group ref="oscal:everything-inline"/>
                <xsl:apply-templates/>
                <xsl:apply-templates select="." mode="default-attributes"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="lines">
        <xs:element name="{@named}" maxOccurs="unbounded" minOccurs="{ number(@required = 'yes') }">
            <xs:complexType mixed="true">
                <xs:group ref="oscal:everything-inline"/>
                <xsl:apply-templates/>
                <xsl:apply-templates select="." mode="default-attributes"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="define-feature | define-part | define-statement">
        <xs:element name="{@name}">
            <xsl:apply-templates select="." mode="part-contents"/>
        </xs:element>
    </xsl:template>
    
    <xsl:template mode="part-contents" match="*">
        <xs:complexType>
            <xsl:for-each-group select="* except attribute" group-by="true()">
                <xs:sequence>
                    <xsl:apply-templates select="current-group()"/>
                </xs:sequence>
            </xsl:for-each-group>
            <xsl:apply-templates select="attribute"/>
            <xsl:apply-templates select="." mode="default-attributes"/>
        </xs:complexType>
    </xsl:template>
    
    <xsl:template mode="part-contents" match="define-statement | statements | statement">
        <xs:complexType>
            <xs:group ref="oscal:prose" maxOccurs="unbounded" minOccurs="0"/>
            <xsl:apply-templates select="attribute"/>
            <xsl:apply-templates select="." mode="default-attributes"/>
        </xs:complexType>
    </xsl:template>
    
    <xsl:template match="prose">
        <xs:group ref="oscal:prose" maxOccurs="unbounded" minOccurs="0"/>
    </xsl:template>
    
    <xsl:template match="feature | part | statement">
        <xs:element name="{@named}" minOccurs="{ number(@required = 'yes') }">
            <xsl:apply-templates select="." mode="part-contents"/>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="features | parts | statements">
        <xs:element name="{@named}" maxOccurs="unbounded" minOccurs="{ number(@required = 'yes') }">
            <xsl:apply-templates select="." mode="part-contents"/>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="attribute">
        <xs:attribute name="{ @name }" type="xs:string">
            <xsl:for-each select="@required[.='yes']">
                <xsl:attribute name="use">required</xsl:attribute>
            </xsl:for-each>
            <xsl:for-each select="@datatype">
                <xsl:attribute name="type" expand-text="true">xs:{ . }</xsl:attribute>
            </xsl:for-each>
        </xs:attribute>
    </xsl:template>
    
    <xsl:template match="*" mode="default-attributes">
        <xsl:if test="not(attribute/@name='id')">
            <xs:attribute name="id" type="xs:ID"/>
        </xsl:if>
    </xsl:template>
    
    
    
    
</xsl:stylesheet>