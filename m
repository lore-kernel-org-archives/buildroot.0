From: Lubomir Rintel <lkundrak@v3.sk>
Date: Sun, 17 May 2020 13:53:35 +0200
Subject: [Buildroot] [PATCH 09/15] board/olpc/xo-1: enable STAGING
In-Reply-To: <20200517115341.1677382-1-lkundrak@v3.sk>
References: <20200517115341.1677382-1-lkundrak@v3.sk>
Message-ID: <20200517115341.1677382-10-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The DCON driver for the platform is a staging driver.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 board/olpc/xo-1/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/olpc/xo-1/linux.config b/board/olpc/xo-1/linux.config
index 63566e8b90..356fbd6071 100644
--- a/board/olpc/xo-1/linux.config
+++ b/board/olpc/xo-1/linux.config
@@ -64,6 +64,7 @@ CONFIG_SND_CS5535AUDIO=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_MMC_SDHCI_PCI=y
+CONFIG_STAGING=y
 CONFIG_FB_OLPC_DCON=y
 CONFIG_XO1_RFKILL=y
 CONFIG_RESET_CONTROLLER=y
-- 
2.26.2
