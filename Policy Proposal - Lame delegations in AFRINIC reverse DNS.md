# Policy Proposal: Lame delegations in AFRINIC reverse DNS (-02)

|  Policy ID:       |  AFPUB-2017-DNS-001-DRAFT-02
|:------------------|:-----------------------------
|  Submission Date: |  November 2017
|  Version:         |  2

---

Authors:

    D. Shaw         <daniel @ afrinic.net>
    A. Phokeer      <amreesh @ afrinic.net>
    N. Goburdhan    <nishal @ pch.net>
    J. Engelbrecht  <jaco @ jacoengelbrecht.eu>

---


## 1. The Problem Being Addressed by this Proposal

### DNS 'Lame' Delegations

In the DNS, a "lame" delegation is a DNS misconfiguration error. If a given DNS nameserver is designated as an authoritative server for a domain name, but does not return authoritative data for that name when queried, this is considered a "lame" delegation.

This could be due to the nameserver not having authoritative data for the DNS zone, or simply not responding at all.

DNS misconfigurations such as this have an operational impact on the global DNS as they cause additional unnecessary queries compared to having no delegations at all. However the end result to a DNS client is ultimately the same: No data is found.

Also see:

 * [RFC1713, Section 2.3](https://tools.ietf.org/html/rfc1713)

 * [DNS Misconfiguration errors: Impact of Configuration Errors on DNS Robustness](http://web.cs.ucla.edu/~lixia/papers/09DNSConfig.pdf)

 * [Lame delegation in the AFRINIC database: How lame are our reverse delegations?](http://afrinic.net/blog/165-how-lame-are-our-reverse-delegations)

A large number of the reverse DNS delegations from the AFRINIC database are misconfigured in this way.


## 2. How this Proposal Addresses the Problem

### 2.1.  Summary

The aim of the policy is to give AFRINIC staff the permission to remove "lame" delegation records from 'domain' objects in the AFRINIC database.

### 2.2.  Scope of the Policy

This policy would only apply to .arpa domain objects found in the AFRINIC registry database. It excludes incoming "minority" resource records from other RIRs, and legacy resources.

## 3. Proposal 

### 3.1. Policy Update

The following text will be added into the Consolidated Policy Manual:

---

> ### 10.7 Removal of 'Lame' Delegations
> 
> Once a given 'nserver' attribute has been determined to be lame for a given domain, and reasonable attempts have been made to contact the responsible person(s), the nserver attribute must then be removed from the given domain object. A 'remarks' line should be added to the domain object in the database recording this.
> 
> In the event all nameserver records are lame for a given delegation, the domain object would be removed in its entirety. Historical information about removed domain objects should be archived for a reasonable amount of time and made available as necessary.

---

### 3.2 Sample Implementation Guideline

A [sample operational manual](https://raw.githubusercontent.com/techdad/afpub-2017-lame-dns/master/sample-implementation/afpub-2017-lame-dns-sample-ops-manual-draft-00.txt) is available online as a suggested guideline to AFRINIC staff.

Please note that this is a **sample** by the authors for a **suggested** implementation, and **not** part of the policy. It does not necessarily reflect a final implementation by AFRINIC staff.

## 4. Similar Policies in Other Regions

 * ARIN - [Policy 2002-1: Lame Delegations in IN-ADDR.ARPA](https://www.arin.net/policy/proposals/2002_1.html)
 * APNIC - [Prop-038: Amending APNIC's lame DNS reverse delegation policy](https://www.apnic.net/community/policy/proposals/prop-038/)
 * LACNIC - [Lame Delegation Policy within the Region Covered by LACNIC](http://www.lacnic.net/en/web/lacnic/manual-6)

## 5. Revision History

 * 2017-03-15: 1st draft
 * 2017-11-16: 2nd draft
