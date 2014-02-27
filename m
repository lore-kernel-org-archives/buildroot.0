From: Sven Neumann <neumann@teufel.de>
Date: Thu, 27 Feb 2014 14:06:35 +0100
Subject: [Buildroot] [PATCH] libarchive: fix download location
Message-ID: <1393506395-15064-1-git-send-email-neumann@teufel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/libarchive/libarchive.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 44d9cd2..0b8713f 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBARCHIVE_VERSION = 3.0.4
-LIBARCHIVE_SITE = http://github.com/downloads/libarchive/libarchive
+LIBARCHIVE_SITE = http://www.libarchive.org/downloads/
 LIBARCHIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-- 
1.8.3.2
