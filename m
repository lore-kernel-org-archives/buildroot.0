From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Feb 2011 23:00:35 +0100
Subject: [Buildroot] [git commit master 1/1] libpng: bump to version 1.4.5
Message-ID: <20110202221651.1089C8F33C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b47a4d1073fa9f92692bdd2a9748f36db3e2f1fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpng/libpng.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 82b88da..699561b 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -3,11 +3,10 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION = 1.4.4
+LIBPNG_VERSION = 1.4.5
 LIBPNG_SERIES = 14
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
-LIBPNG_LIBTOOL_PATCH = NO
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
-- 
1.7.3.4
