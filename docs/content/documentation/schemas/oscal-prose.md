---
title: Schema Reference - OSCAL Prose Model
description: OSCAL Profile Model XML Schema Reference
permalink: /docs/schemas/oscal-prose/
layout: post
sidenav: schemas
schema: oscal-profile-xml
---

OSCAL Prose to be documented here.

## HTML compatibility

Prose in OSCAL is designed to map cleanly to an HTML subset. Note that this element set is not maintained in the HTML namespace. It is intended not to be treated directly as HTML, but to be readily and transparently converted to HTML (or other presentational formats) as needed.

Only a subset of HTML's block elements are permitted: paragraphs (`p`), headers (`h1`-`h6`), tables (`table`), preformatted text (`pre`), and ordered and unordered lists (`ul` and `ol`).

Within paragraphs or text content (inline) the following elements are permitted: `a`, `strong`, `em`, `b`, `i`, `sup`, `sub`. `b` and `i` are included for flexibility but they

In particular, note that elements such as `div`, `blockquote`, `section` or `aside`, used in HTML to provide structure, are not permitted. Structures in OSCAL should be represented using OSCAL elements (or objects in JSON) such as `part`, which can include prose.

## Markdown compatibility

OSCAL also maintains a mapping from its HTML-like tagging for prose into a Markdown syntax. This mapping is shown below. Since markdown (as an array of string objects) is our syntax of choice for representing unstructured prose in JSON, transparent and lossless bidirectional mapping between the OSCAL markup (tag) representation, into its Markdown equivalent, is a requirement.

When in doubt, we look to CommonMark for guidance on syntax, largely because it is more rigorously tested than many others.

