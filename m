From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Dec 2015 19:33:26 -0300
Subject: [Buildroot] [PATCH 1/2] exfat: bump to version 1.2.3
Message-ID: <1451342007-31940-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/exfat/exfat.hash | 2 +-
 package/exfat/exfat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exfat/exfat.hash b/package/exfat/exfat.hash
index af67785..a6dbdac 100644
--- a/package/exfat/exfat.hash
+++ b/package/exfat/exfat.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	f444cd2849295b8de7fc61022fbf02f5bb1a84790c43f0c75ba3bf96f4619dd4	fuse-exfat-1.2.1.tar.gz
+sha256	f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8acd357dd463c2355d9	fuse-exfat-1.2.3.tar.gz
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index cc474a7..c7904ba 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_VERSION = 1.2.1
+EXFAT_VERSION = 1.2.3
 EXFAT_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_VERSION)
 EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 EXFAT_DEPENDENCIES = libfuse host-pkgconf
-- 
2.4.10
