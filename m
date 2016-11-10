From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 10 Nov 2016 11:55:24 +0100
Subject: [Buildroot] [PATCH] sunxi-tools: fix license file
Message-ID: <1478775324-1695-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sunxi-tools/sunxi-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index c554a5f..1a58aff 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -7,7 +7,7 @@
 SUNXI_TOOLS_VERSION = v1.4.1
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPLv2+
-SUNXI_TOOLS_LICENSE_FILES = COPYING
+SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
 HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
 FEX2BIN = $(HOST_DIR)/usr/bin/fex2bin
 
-- 
2.7.4
