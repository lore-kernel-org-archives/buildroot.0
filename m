From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 22:01:42 +0200
Subject: [Buildroot] [PATCH] xen: security bump to version 4.10.2
In-Reply-To: <20180930204354.5926-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 30 Sep 2018 22:43:54 +0200")
References: <20180930204354.5926-1-peter@korsgaard.com>
Message-ID: <87a7ns17tl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Drop 0003-memfd-fix-configure-test.patch applied upstream.
 > The 4.10.2 version brings a large number of fixes:

 > https://xenproject.org/downloads/xen-archives/xen-project-410-series/xen-4102.html

 > Including a number of security fixes:

 > XSA-260: x86: mishandling of debug exceptions (CVE-2018-8897)
 > XSA-261: x86 vHPET interrupt injection errors (CVE-2018-10982)
 > XSA-262: qemu may drive Xen into unbounded loop (CVE-2018-10981)
 > XSA-263: Speculative Store Bypass (CVE-2018-3639)
 > XSA-264: preemption checks bypassed in x86 PV MM handling (CVE-2018-12891)
 > XSA-265: x86: #DB exception safety check can be triggered by a guest
 >          (CVE-2018-12893)
 > XSA-266: libxl fails to honour readonly flag on HVM emulated SCSI disks
 >          (CVE-2018-12892)
 > XSA-267: Speculative register leakage from lazy FPU context switching
 >          (CVE-2018-3665)
 > XSA-268: Use of v2 grant tables may cause crash on ARM (CVE-2018-15469)
 > XSA-269: x86: Incorrect MSR_DEBUGCTL handling lets guests enable BTS
 >          (CVE-2018-15468)
 > XSA-272: oxenstored does not apply quota-maxentity (CVE-2018-15470)
 > XSA-273: L1 Terminal Fault speculative side channel (CVE-2018-3620,
 >          CVE-2018-3646)

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
