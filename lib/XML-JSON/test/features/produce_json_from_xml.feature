Feature: Produce JSON from XML
  From OSCAL-formatted XML, produce equivalent JSON

  Scenario Outline: XML field with no ID or flags declared
    Given a single element '<context>'
    When I execute an XSLT transformation
    Then JSON '<output>' should contain a property name whose value is the encoded XML character data

    Examples:
    | context | output |
    | <title>Three Controls from SP800-53</title> | { "title": "Three Controls from SP800-53" } |

  Scenario: XML part with prose
    Given a part with prose context
      """
      <part class="assessment">
        <prop class="method">INTERVIEW</prop>
        <p>Organizational personnel with access enforcement responsibilities</p>
        <p>system/network administrators</p>
        <p>organizational personnel with information security responsibilities</p>
        <p>system developers</p>
      </part>
      """
    When I execute an XSLT transformation
    Then JSON output should contain an object with an equivalent structure
      """
      {
        "part": {
          "class": "assessment",
          "props": [
            {
              "class": "method",
              "STRVALUE": "INTERVIEW"
            }
          ],
          "prose": [
            "Organizational personnel with access enforcement responsibilities",
            "system/network administrators",
            "organizational personnel with information security responsibilities",
            "system developers"
          ]
        }
      }
      """
