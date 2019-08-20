From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:27:48 +0200
Subject: [Buildroot] [PATCH] package/xen: security bump to version 4.11.2
In-Reply-To: <20190729161703.29544-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 29 Jul 2019 18:17:03 +0200")
References: <20190729161703.29544-1-peter@korsgaard.com>
Message-ID: <87k1b79ajf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The 4.11.2 release brings a large number of fixes:
 > https://xenproject.org/downloads/xen-project-archives/xen-project-4-11-series/xen-project-4-11-2/

 > Including a number of security fixes:

 > XSA-284: grant table transfer issues on large hosts
 > XSA-285: race with pass-through device hotplug
 > XSA-287: x86: steal_page violates page_struct access discipline
 > XSA-288: x86: Inconsistent PV IOMMU discipline
 > XSA-290: missing preemption in x86 PV page table unvalidation
 > XSA-291: x86/PV: page type reference counting issue with failed IOMMU update
 > XSA-292: x86: insufficient TLB flushing when using PCID
 > XSA-293: x86: PV kernel context switch corruption
 > XSA-294: x86 shadow: Insufficient TLB flushing when using PCID
 > XSA-295: Unlimited Arm Atomics Operations
 > XSA-297: Microarchitectural Data Sampling speculative side channel

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
