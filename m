From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Feb 2021 14:35:46 +0100
Subject: [Buildroot] [PATCH] package/bind: security bump to version
 9.11.28
In-Reply-To: <20210218082226.5695-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 18 Feb 2021 09:22:26 +0100")
References: <20210218082226.5695-1-peter@korsgaard.com>
Message-ID: <87ft1orzrh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2020-8625: When tkey-gssapi-keytab or tkey-gssapi-credential was
 >   configured, a specially crafted GSS-TSIG query could cause a buffer
 >   overflow in the ISC implementation of SPNEGO (a protocol enabling
 >   negotiation of the security mechanism to use for GSSAPI authentication).
 >   This flaw could be exploited to crash named.  Theoretically, it also
 >   enabled remote code execution, but achieving the latter is very difficult
 >   in real-world conditions

 > For details, see the advisory:
 > https://kb.isc.org/docs/cve-2020-8625

 > In addition, 9.11.26-27 fixed a number of issues, see the release notes for
 > details:
 > https://downloads.isc.org/isc/bind9/9.11.28/RELEASE-NOTES-bind-9.11.28.html

 > Drop now upstreamed patches, update the GPG key for the 2021-2022 variant
 > and update the COPYRIGHT hash for a change of year:

 > -Copyright (C) 1996-2020  Internet Systems Consortium, Inc. ("ISC")
 > +Copyright (C) 1996-2021  Internet Systems Consortium, Inc. ("ISC")

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
