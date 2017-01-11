%%%

    Title = "Lame delegations in reverse DNS"
    abbrev = "Lame delegations in reverse DNS"
    category = "info"
    docName = "AFPUB-2017-{tba-pdwg}"
    ipr = "trust200902"
    area = ""
    workgroup = "AFRINIC Policy"
    
    date = 2017-01-11T00:00:00Z

    [pi]
    private = "yes"
    header = "AFRINIC Policy"
    footer = "AFPUB-2017-{tba-pdwg}"
    
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

    [[author]]
    initials="N."
    surname="Goburdhan"
    fullname="Nishal Goburdhan"

%%%

.# Abstract

A brief intro paragraph goes here

{mainmatter}

# Problem Addressed by this Policy

A brief intro/summary, similar to the abstract, but likely even more brief, simply stating lame delegation is bad. Expand on the problem in the sub-sections.

## What is "Lame Delegation"?

Background / references / definition of lame DNS delegation

Possible info: https://docs.menandmice.com/pages/viewpage.action?pageId=6360996

## Impact of Lame Delegations in the Global DNS

Some brief text about why it's uncool

Some more possible references:

http://dyn.com/blog/recursive-dns-round-trip-times-delegations-dns-performance/

http://archive.oreilly.com/pub/a/sysadmin/2007/04/26/5-basic-mistakes-not-to-make-in-dns.html?page=2


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

 1. 2017-01-10 -- Revision: Draft 00

