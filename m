From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 22:54:27 +0100
Subject: [Buildroot] [PATCH v2 00/15] Add support for STM32F469-DISCO &
 STM32F469-DISCO boards
In-Reply-To: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
References: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
Message-ID: <20160222225427.7d006265@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lee,

On Mon, 22 Feb 2016 18:59:14 +0000, Lee Jones wrote:

>   boot: Add new bootloader afboot-stm32
>   boards: stm32f469-disco: Add kernel patch to provide top compatible
>     string
>   boards: stm32f469-disco: Add kernel patch to provide top compatible
>     string
>   boards: stm32f469-disco: Add kernel patch to provide DTS file
>   boards: stm32f469-disco: Add kernel patch to provide DTS file
>   boards: stm32f469-disco: Add kernel patch to set RAM address to 0
>   boards: stm32f469-disco: Add kernel patch to set RAM address to 0
>   boards: stm32f469-disco: Add OpenOCD patch to supply a new config
>   boards: stm32f469-disco: Add OpenOCD patch to support on-board flash
>     chip
>   boards: stm32f469-disco: Add a helper script to flash images
>   boards: stm32f429-disco: Add a readme.txt
>   boards: stm32f429-disco: Add a helper script to flash images
>   boards: stm32f469-disco: Add a readme.txt
>   configs: Add a tested working STM32F469-DISCO defconfig
>   configs: Add a tested working STM32F429-DISCO defconfig

There are waaaaaaaay too many patches here.

There should be only three patches:

 1/ One adding afboot-stm32
 2/ One adding the stm32f429 defconfig
 3/ One adding the stm32f469 defconfig

Splitting further than that is really unnecessary. You are even adding a
file in PATCH 2, to simply move it in PATCH 3. Ditto with PATCH 4/5 and
6/7!

Could you rework the patch series to merge things a bit?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
