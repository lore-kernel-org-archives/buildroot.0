From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:10:00 +0100
Subject: [Buildroot] [PATCH] package/xen: security bump to version 4.11.1
In-Reply-To: <20181215210032.436-1-peter@korsgaard.com>
References: <20181215210032.436-1-peter@korsgaard.com>
Message-ID: <20181216121000.02dd0676@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Dec 2018 22:00:31 +0100, Peter Korsgaard wrote:
> The 4.11.1 release brings a large number of fixes:
> 
> https://xenproject.org/downloads/xen-archives/xen-project-411-series/xen-4111.html
> 
> Including a number of security fixes:
> 
> XSA-268: Use of v2 grant tables may cause crash on ARM (CVE-2018-15469)
> XSA-269: x86: Incorrect MSR_DEBUGCTL handling lets guests enable BTS
> 	 (CVE-2018-15468)
> XSA-272: oxenstored does not apply quota-maxentity (CVE-2018-15470)
> XSA-273: L1 Terminal Fault speculative side channel (CVE-2018-3620,
>          CVE-2018-3646)
> XSA-275: insufficient TLB flushing / improper large page mappings with AMD
>          IOMMUs
> XSA-276: resource accounting issues in x86 IOREQ server handling
> XSA-277: x86: incorrect error handling for guest p2m page removals
> XSA-278: x86: Nested VT-x usable even when disabled (CVE-2018-18883)
> XSA-279: x86: DoS from attempting to use INVPCID with a non-canonical
>          addresses
> XSA-280: Fix for XSA-240 conflicts with shadow paging
> XSA-282: guest use of HLE constructs may lock up host
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/xen/xen.hash | 2 +-
>  package/xen/xen.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
