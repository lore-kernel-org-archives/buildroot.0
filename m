From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 30 Apr 2015 14:51:51 +0200
Subject: [Buildroot] [PATCH 8/8] configs: rename atmel_xplained_defconfig
In-Reply-To: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1430398311-10804-9-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For consistency, rename atmel_xplained_defconfig to
atmel_sama5d3_xplained_mmc_defconfig as this configuration supports
booting the sama5d3 Xplained with an MMC card (as opposed to the NAND
flash).

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 .../{atmel_xplained_defconfig => atmel_sama5d3_xplained_mmc_defconfig}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename configs/{atmel_xplained_defconfig => atmel_sama5d3_xplained_mmc_defconfig} (100%)

diff --git a/configs/atmel_xplained_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
similarity index 100%
rename from configs/atmel_xplained_defconfig
rename to configs/atmel_sama5d3_xplained_mmc_defconfig
-- 
2.1.4
