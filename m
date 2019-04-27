From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Apr 2019 18:28:01 +0200
Subject: [Buildroot] [PATCH] package/bind: security bump to version
 9.11.6-P1
In-Reply-To: <20190426113256.1977-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 26 Apr 2019 13:32:56 +0200")
References: <20190426113256.1977-1-peter@korsgaard.com>
Message-ID: <87y33vtnu6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 >  - CVE-2018-5743: Limiting simultaneous TCP clients is ineffective
 >    https://kb.isc.org/docs/cve-2018-5743

 >  - CVE-2019-6467: An error in the nxdomain redirect feature can cause
 >    BIND to exit with an INSIST assertion failure in query.c
 >    https://kb.isc.org/docs/cve-2019-6467

 >  - CVE-2019-6468: BIND Supported Preview Edition can exit with an
 >    assertion failure if nxdomain-redirect is used
 >    https://kb.isc.org/docs/cve-2019-6468

 > Add an upstream patch to fix building on architectures where bind does not
 > implement isc_atomic_*.

 > Upstream moved to a 2019 signing key, so update comment in .hash file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
