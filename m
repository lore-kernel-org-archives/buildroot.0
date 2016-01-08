From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 18:51:33 +0100
Subject: [Buildroot] [git commit] giflib: bump to version 5.1.2
Message-ID: <20160108175326.027F2827EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c73fa07f7e8ae76d0803df45b27af31e1cb5695
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/giflib/giflib.hash | 3 ++-
 package/giflib/giflib.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index 46ba7ca..94bcb5d 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,2 +1,3 @@
 # From http://sourceforge.net/projects/giflib/files
-sha1	e5d716e0ccef671103c38c25693927e413fac639	giflib-5.1.1.tar.bz2
+md5	323a9f11ab56c8a2d1715376410ce376	giflib-5.1.2.tar.bz2
+sha1	3f7bc86280db30a7120b2113f9f261301c515ad2	giflib-5.1.2.tar.bz2
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 96a1dfd..6f67a99 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIFLIB_VERSION = 5.1.1
+GIFLIB_VERSION = 5.1.2
 GIFLIB_SOURCE = giflib-$(GIFLIB_VERSION).tar.bz2
 GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
 GIFLIB_INSTALL_STAGING = YES
