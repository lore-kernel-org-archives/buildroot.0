From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Thu, 11 Aug 2011 15:37:07 +0200
Subject: [Buildroot] [PATCH] libpng: bump to 1.5.4
Message-ID: <20110811153707.2d035b09@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Security update.

Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
---
 package/libpng/libpng.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index c4c37d8..f0d6e1d 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -3,8 +3,8 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION = 1.4.8
-LIBPNG_SERIES = 14
+LIBPNG_VERSION = 1.5.4
+LIBPNG_SERIES = 15
 LIBPNG_SITE =
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2 LIBPNG_INSTALL_STAGING
= YES
-- 
1.7.2.3
