From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Feb 2016 18:59:21 +0000
Subject: [Buildroot] [PATCH v2 07/15] boards: stm32f469-disco: Add kernel
	patch to set RAM address to 0
In-Reply-To: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
References: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1456167569-8713-8-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the time of submission, the Mainline kernel does not currently
support the STM32f469.  This patch adds a new config fragment which
we can use to adjust the start of RAM address to 0.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../patches/{kernel => linux}/0003-kernel-config-frag-ram.patch           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename board/stmicroelectronics/stm32/stm32f469-disco/patches/{kernel => linux}/0003-kernel-config-frag-ram.patch (100%)

diff --git a/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0003-kernel-config-frag-ram.patch b/board/stmicroelectronics/stm32/stm32f469-disco/patches/linux/0003-kernel-config-frag-ram.patch
similarity index 100%
rename from board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0003-kernel-config-frag-ram.patch
rename to board/stmicroelectronics/stm32/stm32f469-disco/patches/linux/0003-kernel-config-frag-ram.patch
-- 
1.9.1
