From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Apr 2017 17:51:22 +0200
Subject: [Buildroot] [PATCH-2017.02.x] xen: security bump to version
	4.7.2
In-Reply-To: <20170424212942.11905-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 24 Apr 2017 23:29:42 +0200")
References: <20170424212942.11905-1-peter@korsgaard.com>
Message-ID: <87y3uoqydh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The 4.7.2 release brings a number of bugfixes and improvements:
 > https://www.xenproject.org/downloads/xen-archives/xen-project-47-series/xen-472.html

 > Including fixes for the following security issues:

 > XSA-191: x86 null segments not always treated as unusable (CVE-2016-9386)
 > XSA-192: x86 task switch to VM86 mode mis-handled (CVE-2016-9382)
 > XSA-193: x86 segment base write emulation lacking canonical address checks
 > 	 (CVE-2016-9385)
 > XSA-194: guest 32-bit ELF symbol table load leaking host data (CVE-2016-9384)
 > XSA-195: x86 64-bit bit test instruction emulation broken (CVE-2016-9383)
 > XSA-196: x86 software interrupt injection mis-handled
 > 	 (CVE-2016-9377 CVE-2016-9378)
 > XSA-197: qemu incautious about shared ring processing (CVE-2016-9381)
 > XSA-198: delimiter injection vulnerabilities in pygrub
 > 	 (CVE-2016-9379 CVE-2016-9380)
 > XSA-199: qemu ioport array overflow (CVE-2016-9637)
 > XSA-200: x86 CMPXCHG8B emulation fails to ignore operand size override
 > 	 Files (CVE-2016-9932)
 > XSA-201: ARM guests may induce host asynchronous abort
 >          (CVE-2016-9815 CVE-2016-9816 CVE-2016-9817 CVE-2016-9818)
 > XSA-202: x86 PV guests may be able to mask interrupts (CVE-2016-10024)
 > XSA-203: x86: missing NULL pointer check in VMFUNC emulation (CVE-2016-10025)
 > XSA-204: x86: Mishandling of SYSCALL singlestep during emulation
 >          (CVE-2016-10013)
 > XSA-207: memory leak when destroying guest without PT devices
 > XSA-208: oob access in cirrus bitblt copy (CVE-2017-2615)
 > XSA-209: cirrus_bitblt_cputovideo does not check if memory region is safe
 >          (CVE-2017-2620)

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
