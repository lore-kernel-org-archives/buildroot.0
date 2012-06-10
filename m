From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jun 2012 21:54:16 +0200
Subject: [Buildroot] [git commit] zlib: bump to version 1.2.7
Message-ID: <20120610201113.C048E96E60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb867f991fd7e7891a8abc2e930eea703a88c94c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zlib/zlib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index eca98b8..8f7a18e 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ZLIB_VERSION = 1.2.6
+ZLIB_VERSION = 1.2.7
 ZLIB_SOURCE =zlib-$(ZLIB_VERSION).tar.bz2
 ZLIB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 ZLIB_INSTALL_STAGING = YES
