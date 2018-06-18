const { setWorldConstructor } = require('cucumber');

class CustomWorld {
  constructor() {
    this.context = "";

    this.output = "";
  }

  setContext(context) {
    this.context = `<?xml version="1.0" encoding="UTF-8"?>
<catalog xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://csrc.nist.gov/ns/oscal/1.0 ../../../schema/xml/oscal-catalog-schema.xsd"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0">
  ${context}
</catalog>`;
  }

  setOutput(output) {
    this.output = output;
  }
}

setWorldConstructor(CustomWorld);
