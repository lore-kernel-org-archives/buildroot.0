From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 13:56:18 +0100
Subject: [Buildroot] [git commit branch/next] sunxi-tools: fix license file
Message-ID: <20161110125732.ADC5681971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80e59b9de2e8a4296322ee998e5e99d8a72f6ee4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
