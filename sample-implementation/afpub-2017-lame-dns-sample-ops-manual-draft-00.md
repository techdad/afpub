%%%

    Title = "Lame DNS Operational Manual (Sample)"
    abbrev = "Lame DNS Operational Manual (Sample)"
    category = "info"
    docName = "AFPUB-2017-DNS001-OPS-00"
    ipr = "trust200902"
    area = ""
    workgroup = "AFRINIC Operations"
    
    date = 2017-04-08T00:00:00Z

    [pi]
    private = "yes"
    header = "AFRINIC Ops"
    footer = "AFPUB-2017-DNS001-OPS-00"
    
    [[author]]
    initials="D."
    surname="Shaw"
    fullname="Daniel Shaw"
    organization = "AFRINIC"
      [author.address]
      email = "daniel@afrinic.net"

    [[author]]
    initials="A."
    surname="Phokeer"
    fullname="Amreesh Phokeer"
    organization = "AFRINIC"
      [author.address]
      email = "amreesh@afrinic.net"

    [[author]]
    initials="N."
    surname="Goburdhan"
    fullname="Nishal Goburdhan"
    organization = "Packet Clearing House"
      [author.address]
      email = "nishal@pch.net"

    [[author]]
    initials="J."
    surname="Engelbrecht"
    fullname="Jaco Engelbrecht"
      [author.address]
      email = "jaco@jacoengelbrecht.eu"
%%%

{mainmatter}


# Introduction

## Requirements Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC2119](https://www.rfc-editor.org/rfc/rfc2119.txt).

## What Is This Document?

This document is a sample guideline for an operational manual to accompany the AFRINIC Policy submitted as AFPUB-2017-DNS001-00, should it proceed through the AFRINIC Policy Development Process.

The authors are aware that there is significant work to be done to implement the policy should it pass. They provide this *guideline* for implementation to AFRINIC staff to use, should they choose.

# Sample Policy Implementation Procedure

## Scope

This procedure applies to each `nserver` record within `domain` objects in the AFRINIC WHOIS database. The relationship between `domain` objects to `nserver` records is one-to-many.

## Definition of 'LAME'

For the purpose of this policy implementation, a DNS nameserver is considered lame if, when queried using a standard DNS client or library, the server does not respond back with an authoritative answer for the specific domain.

No differentiation is made here between the behaviours of the DNS server:

* Not responding at all.
* Responding in some way, but not for the specific domain queried.
* Responding for the correct domain, but without the authority bit set.

All the above variations result in a 'lame' delegation.

## Detection, Notification and Removal

### 'Lameness' Checking Method

Tests will be run on a monthly basis on all nameservers found as `nserver` records within `doamin` objects in the AFRINIC WHOIS Database. Checks will be run from at least two different geographical locations, with each site using both address families (ie. IPv4 and IPv6).

*Any single successful recorded authoritative answer for a single address family, or from a single test location is sufficient to NOT consider the nameserver as lame.*

### Timeline for Handling Lame Delegations

 Timeline    | Event    | Actions   |
-------------|----------|-----------|
 Day 0       | Lame delegation is first detected.  | Lame delegation is recorded. Nameserver is re-tested for lame delegation every 3 days.
 Day 15      | Delegation is still detected as lame (after 5 additional checks).  | A remark is added in the domain object for the lame nameservers. Email notification is sent every 5 days for another 15 days (3 notifications) to `Admin-C`, `Tech-C` and `Zone-C` contacts. Lameness checks are still run every 3 days. If a nameserver is not lame anymore, the corresponding remark is removed. |
 Day 30      | Delegation is still lame.  | The `nserver` record is removed from all `domain` objects containing it. Any `domain` object that thus has zero `nserver` records, is removed from the WHOIS database. `Admin-C` and `Tech-C` contacts are notified of all changes. In all instances the original `domain` object is archived.  |

### Object Archival

All nameserver records and domain objects removed from the visible WHOIS database should be viewable on the MyAFRINIC portal for a period of 90 days. After 90 days, the archived version will be discarded permanently.

### Consequences of Domain Objects Removal

Should all the `nserver` records for a given domain object be removed, the domain object must be completely removed, as the nserver record is a mandatory field for the domain object template.

Subsequent DNS lookup of the removed domains in the DNS will be answered by an NXDOMAIN response, meaning this domain is not listed in any AFRINIC arpa DNS zone.

### Reporting

General lame delegation reports should to be published monthly. In addition, a report on lame delegation *cleanup* should be produced at least twice a year.

### Lameness Verification

AFRINIC should put in place a public lameness checker tool. And new nameserver entries for domain objects could be systematically checked for lameness prior to data going into the public WHOIS database.


{backmatter}

# Revision History

 1. 2017-04-08 -- Revision: First draft (00)

