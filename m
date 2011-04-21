From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 21 Apr 2011 23:37:29 +0200
Subject: [Buildroot] [git commit] libpng: bump to version 1.4.7
Message-ID: <20110421214558.A3732827BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8b695c44840cec1b48c52f9c8b4d42250d007494
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpng/libpng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index e64989d..657ba45 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -3,7 +3,7 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION = 1.4.5
+LIBPNG_VERSION = 1.4.7
 LIBPNG_SERIES = 14
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
-- 
1.7.3.4
