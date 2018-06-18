'use strict';

const { should } = require('chai').should();
const { Given, When, Then } = require('cucumber');
const { execSync } = require('child_process');

Given('a single element {string}', function (context) {
  // Write code here that turns the phrase above into concrete actions
  this.setContext(context);
});

When('I execute an XSLT transformation', function () {
  this.setOutput(JSON.parse(execSync('java -jar ~/saxon/saxon9he.jar -xsl:../oscal-catalog-xml-converter.xsl -s:-', {
    input: this.context
  }).toString()));
});

Then('JSON {string} should contain a property name whose value is the encoded XML character data', function (output) {
  var expectedJSON = JSON.parse(output);
  this.output.should.eql(expectedJSON);
});

Given('a part with prose context', function (docString) {
  this.setContext(docString);
});

Then('JSON output should contain an object with equivalent properties', function (docString) {
  var expectedJSON = JSON.parse(docString);
  this.output.should.eql(expectedJSON);
});
