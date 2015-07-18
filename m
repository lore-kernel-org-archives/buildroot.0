From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 11:19:39 +0200
Subject: [Buildroot] [PATCH] gcc: fix undefined reference to .tdata
In-Reply-To: <1437127940-9819-1-git-send-email-abrodkin@synopsys.com>
References: <1437127940-9819-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150718111939.02d9aea5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Fri, 17 Jul 2015 13:12:20 +0300, Alexey Brodkin wrote:
> This fix is done in development tree:
> http://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/366cc86e4f8ff6f00f0b731dc6f78d22c7ac9e0a
> and will be a part of the next release of ARC GNU tools.
> Once that new release happens this patch must be removed.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8b22ac0dc9e3c1cd44f2fdbe5cc99a41cf77f454/
> http://autobuild.buildroot.net/results/37e9c3c79e0a6aea5b89428c2226811ebb3fd611/
> http://autobuild.buildroot.net/results/37e9c3c79e0a6aea5b89428c2226811ebb3fd611/
> and many others.
> 
> Prerequisite:
> "ARC: update tools to arc-2015.06 release": http://patchwork.ozlabs.org/patch/495837/
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...iate-between-a-bss-TLS-initialized-symbol.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/gcc/arc-2015.06/0001-Differentiate-between-a-bss-TLS-initialized-symbol.patch

Applied, thanks. This probably means I should do another round at
rebuilding the external toolchains, at least the ARC one.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
