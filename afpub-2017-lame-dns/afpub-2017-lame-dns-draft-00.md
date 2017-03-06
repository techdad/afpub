%%%

    Title = "Lame delegations in AFRINIC reverse DNS"
    abbrev = "Lame delegations in reverse DNS"
    category = "info"
    docName = "AFPUB-2017-DNS001-00"
    ipr = "trust200902"
    area = ""
    workgroup = "AFRINIC Policy"
    
    date = 2017-03-06T00:00:00Z

    [pi]
    private = "yes"
    header = "AFRINIC Policy"
    footer = "AFPUB-2017-DNS001-00"
    
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
    organization = "INX-ZA"
      [author.address]
      email = "nishal@inx.net.za"

    [[author]]
    initials="J."
    surname="Engelbrecht"
    fullname="Jaco Engelbrecht"
      [author.address]
      email = "bje@serendipity.org.za"
%%%

{mainmatter}


# Introduction

## Requirements Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC2119](https://www.rfc-editor.org/rfc/rfc2119.txt).


# Problem Addressed by this Policy

## Background: What is "Lame Delegation"?

In the DNS, generally, a lame delegation is a type of error that results when a name server which is designated as the authoritative server for a domain name, when queried, does not have authoritative data for that name.

## Impact of Lame Delegations in the Global DNS

In the in-addr.arpa and ip6.arpa zones, as applicable to this policy, the DNS records considered are NS records, delegating authority further down the chain of authority.

With such a delegation resulting in a lame responses, the most obvious  issue is complete failure for the specific .ARPA sub-zone that is being delegated to.

This is similar to not having any delegations in place at all: The sub-set of .ARPA records cannot be found and so reverse DNS lookups will fail for that set of IP address resources.

With no delegation in place, the failure is immediate and final. The querying client for a particular zone will get a fast response from the parent zone's name-server, and do no further lookups.

But comparing to a lame delegation, the client receives a referral to the lame (and invalid or broken) name-server(s). It then has to look them up by name before then querying one or more for the originally requested record.

If the first name-server in the set fails, the client may try the remainder, one by one if all are lame.

In some cases the lameness is a result of non-authority or missing records, but in others the lame name-server is non-existent or unresponsive. In these cases, the client also has to wait for a time-out before trying the next or failing.

In summary, lame name-server delegations as compared to no delegation result in additional DNS traffic and a far greater time to respond for the client, with the same practical end outcome.

In addition, the higher level parent zones that contain these useless and effectively invalid NS records are unnecessarily larger then needed. There is also a potential impact on any statistical data drawn from the parent zone(s).


# How this Policy Addresses the Problem

## Summary

This policy lays out a process to monitor for name-server records resulting in lame delegations, and a phased approach to removing these records from the DNS.

## Scope of the Policy

This policy is intended to apply only to the DNS zones under in-addr.arpa and ip6.arpa managed by AFRINIC. And should check the NS records as sourced from `domain` objects in the AFRINIC WHOIS database.

More specifically, this policy is only applicable to reverse DNS delegations managed within the AFRINIC region for AFRINIC majority RIR IP allocations and assignments.

This policy should not monitor or consider reverse DNS delegations for minority RIR IP address resources or legacy IP address resources.


# Policy to address lame DNS delegations

## Process Detail

### Monitoring / Checking

All `domain` objects in the AFRINIC WHOIS database must be periodically examined, and all `nserver` attributes extracted for checking.

Each `nserver` found must be checked to:
    
 * Respond to DNS queries.
 * Reply with a valid SOA record for the domain it's associated with in the WHOIS database.

This periodic checking should be automated. The checks should be relatively frequent, but not so frequent as to cause any operational impact to either AFRINIC systems or the global DNS.

It is recommended that when a name-server fails a check for the first time, this is initially just recorded. Only after multiple lameness checks failing should a name-server be flagged for further action.

### Notification

Once one or more name-servers are flagged as lame, a reasonable attempt must be made to contact the person(s) responsible for the `domain` object and the DNS delegation.

It is recommended that all of the `admin-c`, `tech-c` and `zone-c` contacts be tried in parallel.

In addition, contact information may be extracted from associated `org` and/or `mnt-by` attributes when appropriate.

Unanswered notification communications should also be re-tried more than once before moving on to further actions.

It is recommended that the communication frequency, communication method(s) and number of attempts should be standardised and publicly documented.

### Delegation Removal

Once a given name-server had been determined to be lame for a given DNS `domain`, and reasonable attempts have been made to contact a responsible person, the name-server must then be removed from the given DNS `domain`.

The name-server must not be removed from all WHOIS objects and DNS zones, as it may not be uniformly lame for other zones is serves.

Only those name-servers flagged as lame should be removed from a given domain. The domain must *not* have all `nserver` attributes removed.

These removals should be automated. An optional `remarks` line may be added to the domain record in the database.

### Re-instatement

Once corrected or alternate name-servers are available for a given reverse DNS zone, the responsible person(s) would add delegation to them in the same way as a new delegation is done for a new IP assignment or allocation.

This process is  found in the AFRINIC document "[How to request reverse delegation in AFRINIC region?](https://www.afrinic.net/library/corporate-documents/216-how-to-request-reverse-delegation-in-afrinic-region)".


# Further Information

## Similar policies in other regions

 * ARIN: [Policy 2002-1: Lame Delegations in IN-ADDR.ARPA](https://www.arin.net/policy/proposals/2002_1.html)
 * APNIC: [prop-038: Amending APNIC’s lame DNS reverse delegation policy](https://www.apnic.net/community/policy/proposals/prop-038/)
 * LACNIC: [Lame Delegation Policy within the Region Covered by LACNIC](http://www2.lacnic.net/documentos/politicas/lacnic-V-lame-delegation-en.pdf)
 * RIPE NCC: No known policy at this time. 

## Possible Operational Impact(s)

A DNS delegation of a child-zone by lame NS records in the parent-zone will result in partial or complete failure of the child-zone.

Therefore, removing these lame records at the parent will have no further adverse affects on the child zone.

In the case of partial lameness, where not *all* name-servers are found to be lame, the impact will be positive: The removal of failing delegations will result in no DNS failures, rather than partial.


{backmatter}

# Glossary

 * DNS: Domain Name System
 * RIR: Regional Internet Registry
 * Majority RIR: Holds the parent allocation from IANA.  
 * Minority RIR: Administrates space within the majority allocation.
 * Legacy Internet Resources: Internet number resources obtained prior to or otherwise outside the current hierarchical Internet registry system.
 * SOA record: "Start Of Authority" record, at the head of every DNS zone.

# Revision History

 1. 2017-03-06 -- Revision: First draft (00)

