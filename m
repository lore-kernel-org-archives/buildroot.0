From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 10 Nov 2016 10:57:15 +0100
Subject: [Buildroot] [V2] sunxi-tools: bump to version 1.4.1
Message-ID: <1478771835-10420-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sunxi-tools/sunxi-tools.hash | 2 +-
 package/sunxi-tools/sunxi-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-tools/sunxi-tools.hash b/package/sunxi-tools/sunxi-tools.hash
index 90991a3..efb2b54 100644
--- a/package/sunxi-tools/sunxi-tools.hash
+++ b/package/sunxi-tools/sunxi-tools.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	8b5defeaabec99b6c759ed1d99d91e4d23188431868d17cf6ed144f37e42bee5  sunxi-tools-89dac0f7eaaedd0d8afa9d5a3c713c7c1ccb9cf6.tar.gz
+sha256	da5d762608517b4b2e9bd392bd9a63afae3973d9c8264cbcfb757ddac8120d1b  sunxi-tools-v1.4.1.tar.gz
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 23e3135..c554a5f 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_TOOLS_VERSION = 89dac0f7eaaedd0d8afa9d5a3c713c7c1ccb9cf6
+SUNXI_TOOLS_VERSION = v1.4.1
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPLv2+
 SUNXI_TOOLS_LICENSE_FILES = COPYING
-- 
2.7.4
