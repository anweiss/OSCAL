---
title: Background
description: Background
permalink: /learnmore/

layout: post
---

## What is OSCAL?

NIST is developing the Open Security Controls Assessment Language (OSCAL) standard and data-centric framework that can be applied to an information system for documenting and assessing its security controls. Today, security controls and profiles are represented in proprietary ways and are expressed in prose format rather than being machine readable. This can lead to imprecise implementation and differences in interpretation, and requires manual effort to implement the controls. An important goal of OSCAL is to move the security controls and profiles from a text-based and manual approach (using word processors or spreadsheets) to a standardized and machine-readable format that improves both the User Experience (UX) and Machine Experience (MX) of system security planning, assessment and authorization. With standard, authoritative reference data sets encoded in OSCAL, along with the support of automated processes, security professionals will be able to do better work with less effort.

## Why OSCAL?

There are a number of factors contributing to the challenge faced by information system security professionals today: multiple regulatory compliance standards and frameworks ([NIST FISMA](https://www.nist.gov/programs-projects/federal-information-security-management-act-fisma-implementation-project), [PCI](https://www.pcisecuritystandards.org/pci_security/), [HIPAA](https://www.hhs.gov/hipaa/index.html), [ISO 27001](https://www.iso.org/isoiec-27001-information-security.html) etc.), which change over time; their overlapping scope and the requirement to manage them together; and the size, complexity and ongoing development of the systems being documented. To provide assurance of a system's compliance posture, the implementation of security systems must be both correctly described, and validated against relevant security controls. This is resource-intensive and often infeasible within budget constraints given the complexity of the problem.

The ability of OSCAL to streamline and standardize the security documentation, implementation, and assessment process will reduce complexity, decrease implementation costs, and enable the continuous assessment of system security against multiple sets of requirements simultaneously. This approach has the added benefit of significantly reducing the paperwork associated with current processes, helping government agencies meet the goals of the [Paperwork Reduction Act](https://en.wikipedia.org/wiki/Paperwork_Reduction_Act).

## How OSCAL Supports Your Role



<ul class="usa-accordion-bordered">
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="creators">
      OSCAL for Authors of Policies, Guidelines and Standards
    </button>
    <div id="creators" class="usa-accordion-content">
{% capture creators %}

***Systems security policy professionals who set requirements for security programs, both across and within organizations and agencies.***

OSCAL provides a standard solution for building security profiles that set the expectations for implementation within the program and associated information systems.

### How Does OSCAL Help Me?

* Ensures consistency of control implementation across the enterprise.

* Improves the transparency of policy implementation by automating assessment.

* Permits market-based development of shared profiles, working across agencies, compliance frameworks and domains.

* Improves the Machine Experience (MX) for vendors in implementing enterprise-specific policies by representing them in a standards-based format.

{% endcapture %}

{{ creators | markdownify }}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="security_pros">
      OSCAL for Security Professionals
    </button>
    <div id="security_pros" class="usa-accordion-content">
{% capture securitypros %}

***Security professionals who document or implement security controls within information systems.***

OSCAL provides a standard for documenting security and privacy controls that maps across multiple compliance frameworks (i.e. NIST, PCI, etc.) and a method for attesting to the implementation of the controls within information systems

### How Does OSCAL Help Me?

* Enables continuous maintenance of control documentation within a framework designed for that purpose.

* Permits the centralization of configuration management within and across security documentation and applications; this can reduce the attack surface and make it easier to implement controls for least privilege.

* Reduces the amount of paperwork required to implement multiple compliance frameworks.

* Ensures that security as proposed and planned (defined in the controls) matches with security as implemented, with less need for manual assessments.

* Flattens the learning curve for new staff by enabling them to focus on problems not technology.

* Enables mapping standard catalogs of controls to common profiles, reducing the number of assessments required to ensure compliance with multiple frameworks.

{%endcapture %}
{{ securitypros | markdownify }}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="assessors">
      OSCAL for Assessors
    </button>
    <div id="assessors" class="usa-accordion-content">
{% capture assessors %}

***Audit and assessment personnel who validate the accuracy of security plans and assess the implementation of security controls within information systems.***

OSCAL standardizes documentation of security controls within a specific profile, while establishing a framework for information systems to attest programmatically to the state of the security controls being addressed.

### How Does OSCAL Help Me?

* Reduces the amount of manual labor need to assess the implementation of controls.

* Permits flexibility through profiling for tailoring baselines to a set of appropriate controls for any agency information system.

* Provides real-time or near real-time assurance programmatically, allowing any security drift to be detected earlier and reducing overall risk.

* Enables mapping standard catalogs of controls to common profiles, reducing the number of assessments required to ensure compliance with multiple frameworks.

{% endcapture %}
{{ assessors | markdownify }}
    </div>
  </li>
  <li>
    <button class="usa-accordion-button"
      aria-expanded="false"
      aria-controls="tool-devs">
      OSCAL for Tool Developers
    </button>
    <div id="tool-devs" class="usa-accordion-content">
{% capture toolvendors %}

***Tool developers who build security compliance systems (Electronic Governance Risk and Compliance [eGRC] systems) or who provide secure infrastructure/software solutions to the Federal Government or to highly regulated industries.***

OSCAL provides a standard for consuming control, catalog, profile, and implementation data to visualize and automate security compliance processes. Provides an assessment standard for infrastructure and software solutions to attest to their security control implementation in an automated manner.

### How Does OSCAL Help Me?

* Use automated tools to create more complete and consistent security plans with machine assistance.

* Easily attest to the state of controlimplementations, reducing the paperwork burden associated with serving federal agencies.

* Expose security control and assessment data in a standard specification which can be represented via JSON or XML.

* Improve the User Experience (UX) and Machine Experience (MX) by offering new compliance tools.

* Minimize the need for vendors to customize solutions for customers by adhering to a broad-based standard.

{% endcapture %}
{{ toolvendors | markdownify }}
    </div>
  </li>
</ul>


[Learn More](/docs/)

## Get Involved 

To learn more about how you can get involved, [contact us](contact).
