From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 20:58:48 +0200
Subject: [Buildroot] [git commit] board/olpc/xo-1: enable STAGING
Message-ID: <20200617190503.2E508814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcf581f2389160df7dbcb8f167fa5697b5181b5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DCON driver for the platform is a staging driver.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
