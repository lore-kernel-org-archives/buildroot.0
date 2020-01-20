From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2020 08:39:11 +0100
Subject: [Buildroot] [PATCH 2/3] package/xen: security bump to version
 4.12.2
In-Reply-To: <20200119170358.5408-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 19 Jan 2020 18:03:57 +0100")
References: <20200119170358.5408-1-peter@korsgaard.com>
 <20200119170358.5408-2-peter@korsgaard.com>
Message-ID: <87r1zupof4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The 4.12.2 release brings a large number of fixes:
 > https://xenproject.org/downloads/xen-project-archives/xen-project-4-12-series/xen-project-4-12-2/

 > Including a number of security fixes:

 > XSA-296: VCPUOP_initialise DoS (CVE-2019-18420)
 > XSA-298: missing descriptor table limit checking in x86 PV emulation
 > 	 (CVE-2019-18425)
 > XSA-299: Issues with restartable PV type change operations (CVE-2019-18421)
 > XSA-301: add-to-physmap can be abused to DoS Arm hosts (CVE-2019-18423)
 > XSA-302: passed through PCI devices may corrupt host memory after
 >          deassignment (CVE-2019-18424)
 > XSA-303: ARM: Interrupts are unconditionally unmasked in exception handlers
 > 	 (CVE-2019-18422)
 > XSA-304: x86: Machine Check Error on Page Size Change DoS (CVE-2018-12207)
 > XSA-305: TSX Asynchronous Abort speculative side channel (CVE-2019-11135)
 > XSA-306: Device quarantine for alternate pci assignment methods
 > 	 (CVE-2019-19579)
 > XSA-307: find_next_bit() issues (CVE-2019-19581 CVE-2019-19582)
 > XSA-308: VMX: VMentry failure with debug exceptions and blocked states
 > 	 (CVE-2019-19583)
 > XSA-309: Linear pagetable use / entry miscounts (CVE-2019-19578)
 > XSA-310: Further issues with restartable PV type change operations
 > 	 (CVE-2019-19580)
 > XSA-311: Bugs in dynamic height handling for AMD IOMMU pagetables
 > 	 (CVE-2019-19577)

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
