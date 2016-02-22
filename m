From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Feb 2016 18:59:19 +0000
Subject: [Buildroot] [PATCH v2 05/15] boards: stm32f469-disco: Add kernel
	patch to provide DTS file
In-Reply-To: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
References: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1456167569-8713-6-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the time of submission, the Mainline kernel does not currently
support the STM32f469.  This patch adds a new DTS file which
contains some critical information to ensure a clean, visible boot.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../patches/{kernel => linux}/0002-kernel-new-dts-file.patch              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename board/stmicroelectronics/stm32/stm32f469-disco/patches/{kernel => linux}/0002-kernel-new-dts-file.patch (100%)

diff --git a/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0002-kernel-new-dts-file.patch b/board/stmicroelectronics/stm32/stm32f469-disco/patches/linux/0002-kernel-new-dts-file.patch
similarity index 100%
rename from board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0002-kernel-new-dts-file.patch
rename to board/stmicroelectronics/stm32/stm32f469-disco/patches/linux/0002-kernel-new-dts-file.patch
-- 
1.9.1
