From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Nov 2017 21:50:39 +0100
Subject: [Buildroot] [PATCH] fwup: fix for ARC toolchain
In-Reply-To: <20171114055956.45043-1-didin@synopsys.com>
References: <20171114055956.45043-1-didin@synopsys.com>
Message-ID: <20171117215039.34511e2e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 08:59:56 +0300, Evgeniy Didin wrote:
> Building fwup package with ARC toolchain causes internal compiler error.
> Adding patch for ARC gcc solves this issue. In the next version of toolchain,
> this problem has already been taken into account.
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/a1b/a1bd5084309ced6c2d1b311617e5d9f0c362557a//
> 	http://autobuild.buildroot.net/results/dd3/dd3000bd99d71383ce82cd6b01b543cd9660130e//
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0001-fix-checking-for-jumps.patch              | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/gcc/arc-2017.09-release/0001-fix-checking-for-jumps.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
