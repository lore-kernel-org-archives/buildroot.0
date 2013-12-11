From: Brian Beattie <beattie@beattie-home.net>
Date: Tue, 10 Dec 2013 16:25:03 -0800
Subject: [Buildroot] [PATCH 1/2] update sunxi-boards to newer commit as
 recomended for pcDuino board
Message-ID: <1386721503.2817.18.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/sunxi-boards/sunxi-boards.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-boards/sunxi-boards.mk
b/package/sunxi-boards/sunxi-boards.mk
index 932b625..c65d00f 100644
--- a/package/sunxi-boards/sunxi-boards.mk
+++ b/package/sunxi-boards/sunxi-boards.mk
@@ -4,7 +4,7 @@
 #

################################################################################
 
-SUNXI_BOARDS_VERSION = 25a868189dbaa40872b2ac7d8a941dd73972eb08
+SUNXI_BOARDS_VERSION = 4016ad7fb6c249c0bd6b6d804c706f9a7a165cc6
 SUNXI_BOARDS_SITE = $(call github,linux-sunxi,sunxi-boards,
$(SUNXI_BOARDS_VERSION))
 SUNXI_BOARDS_DEPENDENCIES = host-sunxi-tools
 SUNXI_BOARDS_INSTALL_IMAGES = YES
-- 
1.8.1.2


-- 
"For every complex problem there is an answer that is clear, simple, and
wrong." -- H. L. Mencken

Brian Beattie<beattie@beattie-home.net> -- www.brian-beattie.com
LFS12947
