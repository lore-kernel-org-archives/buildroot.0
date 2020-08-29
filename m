From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 13:37:21 +0200
Subject: [Buildroot] [PATCH] package/squid: security bump to version 4.13
In-Reply-To: <20200829095120.15263-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 29 Aug 2020 11:51:19 +0200")
References: <20200829095120.15263-1-peter@korsgaard.com>
Message-ID: <87v9h1isy6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2020-15810: HTTP(S) Request Smuggling
 > Due to incorrect data validation Squid is vulnerable to HTTP Request
 > Smuggling attacks against HTTP and HTTPS traffic.  This leads to cache
 > poisoning.
 > https://github.com/squid-cache/squid/security/advisories/GHSA-3365-q9qx-f98m

 > CVE-2020-15811: HTTP(S) Request Splitting
 > Due to incorrect data validation Squid is vulnerable to HTTP Request
 > Splitting attacks against HTTP and HTTPS traffic.  This leads to cache
 > poisoning.
 > https://github.com/squid-cache/squid/security/advisories/GHSA-c7p8-xqhm-49wv

 > CVE-2020-24606: Denial of Service processing Cache Digest Response
 > Due to Improper Input Validation Squid is vulnerable to a Denial of Service
 > attack against the machine operating Squid.
 > https://github.com/squid-cache/squid/security/advisories/GHSA-vvj7-xjgq-g2jg

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
