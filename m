From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Jan 2020 17:21:37 +0100
Subject: [Buildroot] [PATCH 2/2] board/stm32mp157c-dk2: remove
 unnecessary workaround
In-Reply-To: <20191103115017.788940-2-b.bilas@grinn-global.com>
References: <20191103115017.788940-1-b.bilas@grinn-global.com>
 <20191103115017.788940-2-b.bilas@grinn-global.com>
Message-ID: <20200101172137.4457a417@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Nov 2019 12:50:17 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Since we know the proper solution, remove that faulty patch.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  ...-fix-checking-the-presence-of-an-env.patch | 37 -------------------
>  configs/stm32mp157c_dk2_defconfig             |  1 -
>  2 files changed, 38 deletions(-)
>  delete mode 100644 board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch

Applied to master after improving the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
