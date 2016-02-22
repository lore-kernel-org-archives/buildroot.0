From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 12:08:53 +0100
Subject: [Buildroot] [PATCH 0/9] Add support for STM32F469-DISCO board
In-Reply-To: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
References: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
Message-ID: <20160222120853.3ff1872a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lee Jones,

On Fri, 19 Feb 2016 17:08:56 +0000, Lee Jones wrote:

> Lee Jones (9):
>   boot: Add new bootloader afboot-stm32
>   configs: Add a tested working STM32F469-DISCO defconfig
>   boards: stm32f469-disco: Add a post-image script
>   boards: stm32f469-disco: Add kernel patch to provide top compatible
>     string
>   boards: stm32f469-disco: Add kernel patch to provide DTS file
>   boards: stm32f469-disco: Add kernel patch to set RAM address to 0
>   boards: stm32f469-disco: Add kernel patch to set RAM address to 0
>   boards: stm32f469-disco: Add OpenOCD patch to supply a new config
>   boards: stm32f469-disco: Add OpenOCD patch to support on-board flash
>     chip

Patches 2 to 9 should be squashed together. Indeed, PATCH 2 relies on
having all other patches applied, otherwise it won't work. For example
PATCH 2 references the post-image script, but it is introduced only in
PATCH 3.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
