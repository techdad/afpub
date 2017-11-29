# Lame delegations in AFRINIC reverse DNS (-02)

### Policy Proposal

## AFRINIC 27 - Lagos, Nigeria

### November 2017

#### D. Shaw
#### A. Phokeer
#### N. Goburdhan
#### J. Engelbrecht


---

# What changed since version -01

* A complete rewrite of the text to simplify and clarify.

* Neither the intent, nor the actions and results of the proposal have changed.

* The text is simply now confined to a brief problem statement and the desired end result.

---

# The current situation:

* DNS reverse delegations are generated from WHOIS data. (In `domain` objects). Like:

```
		domain:		0.1.196.in-addr.arpa
		...
		nserver:	ns1.afrinic.net
		nserver:	ns2.afrinic.net
		nserver:	ns3.afrinic.net
		...
```

* A fairly large number of these are "lame", effectively not working.

* The end result of which is equivalent to being non-existent. But with additional failed lookups.


---

# Isn't this just an operational issue?

### What AFRINIC staff _could_ do today:

* Monitor, Warn, Alert

### What _cannot_ be done by staff today:

* Remove or change any data in WHOIS or DNS.


---

# This policy proposal is proposing..

* "...to enable AFRINIC staff to remove 'lame' delegation records from `domain` objects in the AFRINIC database."

* The _How_ and the _When_ are operational/implementation decisions.

--

### Questions ?

