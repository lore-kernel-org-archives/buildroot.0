From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jun 2016 21:24:23 -0300
Subject: [Buildroot] [PATCH 1/2] exfat: bump to version 1.2.4
Message-ID: <1465950264-6832-1-git-send-email-gustavo@zacarias.com.ar>
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
index a6dbdac..cf3aab1 100644
--- a/package/exfat/exfat.hash
+++ b/package/exfat/exfat.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8acd357dd463c2355d9	fuse-exfat-1.2.3.tar.gz
+sha256	9312d23a5d82543ad2e9ab7f0a0b471aea53eeb8eae664451c881b46d849756e	fuse-exfat-1.2.4.tar.gz
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index c7904ba..84b6001 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_VERSION = 1.2.3
+EXFAT_VERSION = 1.2.4
 EXFAT_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_VERSION)
 EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 EXFAT_DEPENDENCIES = libfuse host-pkgconf
-- 
2.7.3
