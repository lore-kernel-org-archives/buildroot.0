From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Dec 2020 09:49:24 +0100
Subject: [Buildroot] [PATCH] package/xen: security bump to version 4.14.1
In-Reply-To: <20201222222512.13322-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 22 Dec 2020 23:25:12 +0100")
References: <20201222222512.13322-1-peter@korsgaard.com>
Message-ID: <87mty3egh7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Includes security fixes up to XSA-359:
 > XSA-345: x86: Race condition in Xen mapping code
 > XSA-346: undue deferral of IOMMU TLB flushes
 > XSA-347: unsafe AMD IOMMU page table updates
 > XSA-348: undue recursion in x86 HVM context switch code (CVE-2020-29566)
 > XSA-351: Information leak via power sidechannel (CVE-2020-28368)
 > XSA-352: oxenstored: node ownership can be changed by unprivileged clients
 >          (CVE-2020-29486)
 > XSA-353: oxenstored: permissions not checked on root node (CVE-2020-29479)
 > XSA-355: stack corruption from XSA-346 change
 > XSA-356: infinite loop when cleaning up IRQ vectors (CVE-2020-29567)
 > XSA-358: FIFO event channels control block related ordering (CVE-2020-29570)
 > XSA-359: FIFO event channels control structure ordering (CVE-2020-29571)

 > And drop now upstreamed security patches.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
