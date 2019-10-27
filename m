From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 14:11:16 +0100
Subject: [Buildroot] [PATCH] board/stm32mp157-dk: rename to the
 sm32mp157c-dk2
In-Reply-To: <20191027125339.11031-1-b.bilas@grinn-global.com>
References: <20191027125339.11031-1-b.bilas@grinn-global.com>
Message-ID: <20191027141116.559de819@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 13:53:39 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> That is useful and needed for upcoming introducing stm32mp157a-dk1 board.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  .gitlab-ci.yml                                         |  2 +-
>  DEVELOPERS                                             |  4 ++--
>  .../{stm32mp157-dk => stm32mp157c-dk2}/genimage.cfg    |  0
>  .../{stm32mp157-dk => stm32mp157c-dk2}/linux.config    |  0
>  .../overlay/boot/extlinux/extlinux.conf                |  0
>  ...1-configs-fix-checking-the-presence-of-an-env.patch |  0
>  .../{stm32mp157-dk => stm32mp157c-dk2}/readme.txt      |  0
>  .../uboot-fragment.config                              |  0
>  ...m32mp157_dk_defconfig => stm32mp157c_dk2_defconfig} | 10 +++++-----
>  9 files changed, 8 insertions(+), 8 deletions(-)
>  rename board/stmicroelectronics/{stm32mp157-dk => stm32mp157c-dk2}/genimage.cfg (100%)
>  rename board/stmicroelectronics/{stm32mp157-dk => stm32mp157c-dk2}/linux.config (100%)
>  rename board/stmicroelectronics/{stm32mp157-dk => stm32mp157c-dk2}/overlay/boot/extlinux/extlinux.conf (100%)
>  rename board/stmicroelectronics/{stm32mp157-dk => stm32mp157c-dk2}/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch (100%)
>  rename board/stmicroelectronics/{stm32mp157-dk => stm32mp157c-dk2}/readme.txt (100%)
>  rename board/stmicroelectronics/{stm32mp157-dk => stm32mp157c-dk2}/uboot-fragment.config (100%)
>  rename configs/{stm32mp157_dk_defconfig => stm32mp157c_dk2_defconfig} (82%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
