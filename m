From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 14:07:23 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32mp157a_dk1: remove uboot
 config fragment
In-Reply-To: <20210715204746.22089-1-texier.pj2@gmail.com>
References: <20210715204746.22089-1-texier.pj2@gmail.com>
Message-ID: <20210718140723.4130aa81@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 15 Jul 2021 22:47:45 +0200
Pierre-Jean Texier <texier.pj2@gmail.com> wrote:

> Running stm32mp1 watchdog is properly recognized and handled by kernel
> watchdog framework since Linux v5.6.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
> ---
>  board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config | 1 -
>  configs/stm32mp157a_dk1_defconfig                              | 1 -
>  2 files changed, 2 deletions(-)
>  delete mode 100644 board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
