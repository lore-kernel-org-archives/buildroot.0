From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 Mar 2012 09:14:28 -0300
Subject: [Buildroot] [PATCH] libpng: bump to version 1.4.10
Message-ID: <1332504868-24119-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libpng/libpng.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 4017871..19d2a71 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-LIBPNG_VERSION = 1.4.9
+LIBPNG_VERSION = 1.4.10
 LIBPNG_SERIES = 14
-LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
+LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
-- 
1.7.3.4
