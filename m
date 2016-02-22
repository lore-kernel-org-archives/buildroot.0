From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 23:33:43 +0100
Subject: [Buildroot] [PATCH v2 01/15] boot: Add new bootloader
 afboot-stm32
In-Reply-To: <1456167569-8713-2-git-send-email-lee.jones@linaro.org>
References: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
 <1456167569-8713-2-git-send-email-lee.jones@linaro.org>
Message-ID: <20160222233343.17e442ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lee,

On Mon, 22 Feb 2016 18:59:15 +0000, Lee Jones wrote:
> This is a _very_ small bootloader for STM32 platforms.
> 
> At submission afboot-stm32 supports the following boards:
> 
>   stm32429i-eval
>   stm32746g-eval
>   stm32f429i-disco
>   stm32f469i-disco
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  boot/Config.in                      |  1 +
>  boot/afboot-stm32/Config.in         |  6 ++++++
>  boot/afboot-stm32/afboot-stm32.hash |  2 ++
>  boot/afboot-stm32/afboot-stm32.mk   | 18 ++++++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 boot/afboot-stm32/Config.in
>  create mode 100644 boot/afboot-stm32/afboot-stm32.hash
>  create mode 100644 boot/afboot-stm32/afboot-stm32.mk

I've applied to next, after doing the following changes:

 - Changed the commit title to "afboot-stm32: new package", which is
   our standard for package additions.

 - Added the "depends on BR2_arm" dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
