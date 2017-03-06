%%%

    Title = "Lame delegations in reverse DNS"
    abbrev = "Lame delegations in reverse DNS"
    category = "info"
    docName = "AFPUB-2017-{.....}"
    ipr = "trust200902"
    area = ""
    workgroup = "AFRINIC Policy"
    
    date = 2017-03-06T00:00:00Z

    [pi]
    private = "yes"
    header = "AFRINIC Policy"
    footer = "AFPUB-2017-{.....}"
    
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

.# Abstract

This policy is intended to address lame DNS delegations specific to the in-addr.arpa and ip6.arpa DNS hierarchies, as applicable to records for IP resources in the AFRINIC region.


{mainmatter}


# Problem Addressed by this Policy


## Background: What is "Lame Delegation"?

In the DNS, generally, a lame delegation is a type of error that results when a name server which is designated as the authoritative server for a domain name, when queried, does not have authoritative data for that name.

## Impact of Lame Delegations in the Global DNS

In the in-addr.arpa and ip6.arpa zones, as applicable to this policy, the DNS records considered are NS records, delegating authority further down the chain of authority.

With such a delegation resulting in a lame responses, the most obvious  issue is complete failure for the specific arpa. sub-zone below being delegated to.

# How this Policy Addresses the Problem

## Summary

Overview of monitor, alert, disable/remove process and phases

## Scope of the Policy

Some text stating this covers in-addr.arpa only, and only for resources managed by AFRINIC.


# Policy

The actual policy (solution) follows here. Maybe start with an intro line or two again.

## Process Detail

### Monitor

Monitor for x-time,etc.

### Notify

Detail about how/how often to try get in touch with resource holder or whoever

### Remove Delegation

Details about what happens next

### Re-instate

How does a resource holder re-add a non-lame delegation. Just point to existing docs.

## Situation in other RIRs

Self explanatory section. Reference links below. Might be better versions, needs some more searching.

https://www.apnic.net/policy/discussions/prop-038-v001.txt
https://www.arin.net/policy/proposals/2002_1.html
http://www2.lacnic.net/documentos/politicas/lacnic-V-lame-delegation-en.pdf
http://www.lacnic.net/en/web/lacnic/manual-6

## Pros and Cons

Some stuff about what the impact may or may not be, to what and to whom.


{backmatter}

# Revision History

 1. 2017-01-06 -- Revision: Fir st draft (01)

