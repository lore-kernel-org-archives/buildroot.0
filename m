From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:12:47 +0200
Subject: [Buildroot] [PATCH 1/4] configs/beeelink_gs1: bump to ATF v2.2
In-Reply-To: <20200216211937.27200-1-peron.clem@gmail.com>
References: <20200216211937.27200-1-peron.clem@gmail.com>
Message-ID: <20200412231247.0ffe86c1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Feb 2020 22:19:34 +0100
Cl?ment P?ron <peron.clem@gmail.com> wrote:

> The WDT workaround patch has been upstreamed.
> 
> Bump to the new ATF version and drop the patch.
> 
> Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
> ---
>  ...er-common-use-r_wdog-instead-of-wdog.patch | 39 -------------------
>  configs/beelink_gs1_defconfig                 |  2 +-
>  2 files changed, 1 insertion(+), 40 deletions(-)
>  delete mode 100644 board/beelink/gs1/patches/arm-trusted-firmware/0001-plat-allwinner-common-use-r_wdog-instead-of-wdog.patch

I've applied patches 1-3. Patch 4 was not merged, indeed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
