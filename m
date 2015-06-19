From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 19 Jun 2015 21:13:21 +0200
Subject: [Buildroot] [V2 1/4] sunxi-board: bump to version
	a6a4e94066f4ec6b26fc7060dc453a6bcf26a504
In-Reply-To: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
References: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1434741204-3988-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sunxi-boards/sunxi-boards.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
index cacf824..83b3842 100644
--- a/package/sunxi-boards/sunxi-boards.mk
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_BOARDS_VERSION = 68acb3b1610a44b9402560623f7e35b7882585e9
+SUNXI_BOARDS_VERSION = a6a4e94066f4ec6b26fc7060dc453a6bcf26a504
 SUNXI_BOARDS_SITE = $(call github,linux-sunxi,sunxi-boards,$(SUNXI_BOARDS_VERSION))
 SUNXI_BOARDS_DEPENDENCIES = host-sunxi-tools
 SUNXI_BOARDS_INSTALL_IMAGES = YES
-- 
2.1.4
