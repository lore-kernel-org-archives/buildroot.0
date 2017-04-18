From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Apr 2017 17:45:41 +0200
Subject: [Buildroot] [PATCH] arc: remove patch for linux vdk defconfig
In-Reply-To: <1492530039-3194-1-git-send-email-vzakhar@synopsys.com>
References: <1492530039-3194-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170418174541.5ccf72f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Apr 2017 18:40:39 +0300, Vlad Zakharov wrote:
> The patch for linux vdk defconfig introduced ARC_SMP_HALT_ON_RESET
> config symbol. In fact that is not required as this symbol is enabled by
> default if ARC_UBOOT_SUPPORT config symbol is set (and it is set in
> vdk configs).
> 
> Also this commit fixes build failure, pointed us by Arnout:
> https://gitlab.com/buildroot.org/buildroot/builds/14419270
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  .../linux/0001-arc-vdk-Disable-halt-on-reset.patch | 32 ----------------------
>  1 file changed, 32 deletions(-)
>  delete mode 100644 board/synopsys/vdk/patches/linux/0001-arc-vdk-Disable-halt-on-reset.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
