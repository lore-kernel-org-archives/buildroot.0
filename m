From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 24 Feb 2012 15:27:56 +0100
Subject: [Buildroot] [git commit] libpng: security bump to version 1.4.9
Message-ID: <20120224152813.5709790B58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dcb7f907a99e628548f810d03e158918a12fee28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpng/libpng.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index f78b61d..4017871 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -3,7 +3,8 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION = 1.4.8
+
+LIBPNG_VERSION = 1.4.9
 LIBPNG_SERIES = 14
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
