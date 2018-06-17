From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:58:48 +0200
Subject: [Buildroot] [PATCH] xen: security bump to version 4.10.1
In-Reply-To: <20180530221713.20890-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 31 May 2018 00:17:13 +0200")
References: <20180530221713.20890-1-peter@korsgaard.com>
Message-ID: <87y3fdsbmf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The 4.10.1 version brings a large number of fixes:
 > https://www.xenproject.org/downloads/xen-archives/xen-project-410-series/xen-4101.html

 > Including a number of security fixes:

 > XSA-252: DoS via non-preemptable L3/L4 pagetable freeing (CVE-2018-7540)
 > XSA-253: x86: memory leak with MSR emulation (CVE-2018-5244)
 > XSA-254: Information leak via side effects of speculative execution
 > 	 (CVE-2017-5753 CVE-2017-5715 CVE-2017-5754)
 > XSA-255: grant table v2 -> v1 transition may crash Xen (CVE-2018-7541)
 > XSA-256: x86 PVH guest without LAPIC may DoS the host (CVE-2018-7542)
 > XSA-258: Information leak via crafted user-supplied CDROM (CVE-2018-10472)
 > XSA-259: x86: PV guest may crash Xen with XPTI (CVE-2018-10471)

 > Also add a hash for the license file while we are at it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
