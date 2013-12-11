From: Brian Beattie <beattie@beattie-home.net>
Date: Tue, 10 Dec 2013 16:25:10 -0800
Subject: [Buildroot] [PATCH 2/2] update sunxi-boards to newer commit as
 recomended for pcDuino board
Message-ID: <1386721510.2817.19.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/sunxi-tools/sunxi-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-tools/sunxi-tools.mk
b/package/sunxi-tools/sunxi-tools.mk
index a6c38d9..f84b286 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -4,7 +4,7 @@
 #

################################################################################
 
-SUNXI_TOOLS_VERSION = 3a94e721dd8d1e13d0b25da0a83463891e8e9ee0
+SUNXI_TOOLS_VERSION = ed6f7969d80b91048b0ed95ccb61cc98f46fead7
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,
$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPLv2+
 SUNXI_TOOLS_LICENSE_FILES = COPYING
-- 
1.8.1.2


-- 
"For every complex problem there is an answer that is clear, simple, and
wrong." -- H. L. Mencken

Brian Beattie<beattie@beattie-home.net> -- www.brian-beattie.com
LFS12947
