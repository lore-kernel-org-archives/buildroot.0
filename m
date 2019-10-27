From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:07:40 +0100
Subject: [Buildroot] [PATCH] configs/stm32mp157_dk: bump U-Boot to
 2019.10
In-Reply-To: <20191027090126.13878-2-b.bilas@grinn-global.com>
References: <20191027090126.13878-1-b.bilas@grinn-global.com>
 <20191027090126.13878-2-b.bilas@grinn-global.com>
Message-ID: <20191027100740.382bc3b8@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 10:01:26 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Add patch to fix mounting rootfs partition properly.
> This issue is already reported upstream.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  ...-fix-checking-the-presence-of-an-env.patch | 37 +++++++++++++++++++
>  configs/stm32mp157_dk_defconfig               |  3 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 board/stmicroelectronics/stm32mp157-dk/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
