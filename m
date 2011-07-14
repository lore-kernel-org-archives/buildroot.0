From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Jul 2011 09:35:52 +0200
Subject: [Buildroot] [git commit] libpng: bump version
Message-ID: <20110714075410.A6AE18A5B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=33cddbb86706dd8d5efa7dda3a68e9af9318412a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security fix.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpng/libpng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 657ba45..c4c37d8 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -3,7 +3,7 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION = 1.4.7
+LIBPNG_VERSION = 1.4.8
 LIBPNG_SERIES = 14
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
-- 
1.7.3.4
