#!/bin/bash

# Produces Metaschema artifacts from an OSCAL Metaschema metaschema
# Including XML and JSON schemas, conversion utilities (XSLTs) and Markdown documentation

METASCHEMAXML=$1
BASE=$2

# munge input file name: oscal-catalog-metaschema.xml becomes oscal-catalog (and later, oscal-catalog-schema)
BASENAME=oscal-$BASE
BASE=$(sed 's/oscal-//'  <<< $BASENAME)

echo "Using basename: $BASENAME"
echo "Using base: $BASE"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

OSCALDIR=$DIR/../..


if [[ ! -v SAXON ]]; then
    if [[ ! -v SAXON_HOME ]]; then
        echo "SAXON_HOME is not set"
        exit 1
    elif [[ -z "$SAXON_HOME" ]]; then
        echo "SAXON_HOME is set to the empty string"
        exit 1
    fi
    SAXON=$SAXON_HOME/usr/SaxonHE9-9-1-1J/saxon9he.jar
fi

# SAXON=/home/circleci/.m2/repository/net/sf/saxon/Saxon-HE/9.9.0-1/Saxon-HE-9.9.0-1.jar minor change
if [ ! -f $SAXON ]; then
    echo "The saxon library was not found at: $SAXON!"
    exit 1
fi

# Saxon CL documented here: http://www.saxonica.com/documentation9.8/using-xsl/commandline.html

LIBDIR=$OSCALDIR/build/metaschema
XSDDIR=$OSCALDIR/schema/xml
JSONDIR=$OSCALDIR/schema/json
UTIL_DIR=$OSCALDIR/util
DOCSDIR=$OSCALDIR/docs/source/includes/schema

XMLDOCS_XSLT="java -jar $SAXON -s:$METASCHEMAXML -o:$LIBDIR/xml/$BASENAME/$BASENAME-xml-docs-md.xsl -xsl:$LIBDIR/xml/produce-metaschema-xml-documentor.xsl"
JSONDOCS_XSLT="java -jar $SAXON -s:$METASCHEMAXML -o:$LIBDIR/json/$BASENAME/$BASENAME-json-docs-md.xsl -xsl:$LIBDIR/xml/produce-metaschema-json-documentor.xsl"

DOC_XML="java -jar $SAXON -s:$METASCHEMAXML -o:$DOCSDIR/xml/_${BASE}.md -xsl:$LIBDIR/xml/$BASENAME/$BASENAME-xml-docs-md.xsl"
DOC_JSON="java -jar $SAXON -s:$METASCHEMAXML -o:$DOCSDIR/json/_${BASE}.md -xsl:$LIBDIR/json/$BASENAME/$BASENAME-json-docs-md.xsl"

$XMLDOCS_XSLT
$DOC_XML
$JSONDOCS_XSLT
$DOC_JSON
echo _ Made XML and JSON documentation _ $DOCSDIR/xml/_${BASE}.md $DOCSDIR/json/_${BASE}.md
echo
