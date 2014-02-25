From: Sven Neumann <neumann@teufel.de>
Date: Tue, 25 Feb 2014 10:30:28 +0100
Subject: [Buildroot] [PATCH] libpng: bump to version 1.6.9
Message-ID: <1393320628-10918-1-git-send-email-neumann@teufel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This also fixes the download URL as oudated versions have been
moved to the "older-releases" sub-folder.

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/libpng/libpng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index f8b4d98..0bfe7d1 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.8
+LIBPNG_VERSION = 1.6.9
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
-- 
1.8.3.2
