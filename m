From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Jun 2015 23:00:37 +0200
Subject: [Buildroot] [git commit] freetype: bump to version 2.6.0
Message-ID: <20150610210420.C4F9481E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdd7fa8fbcf867157e26fa661e5327af50db2b63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.hash |    6 +++---
 package/freetype/freetype.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index f890c7f..16450d0 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/freetype/files/freetype2/2.5.5/
-md5	2a7a314927011d5030903179cf183be0	freetype-2.5.5.tar.bz2
-sha1	7b7460ef51a8fdb17baae53c6658fc1ad000a1c2	freetype-2.5.5.tar.bz2
+# From http://sourceforge.net/projects/freetype/files/freetype2/2.6/
+md5	5682890cb0267f6671dd3de6eabd3e69	freetype-2.6.tar.bz2
+sha1	cd2b144205dd2c61693e2d861069367aa3dde1bc	freetype-2.6.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 56274cb..e3c8240 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.5.5
+FREETYPE_VERSION = 2.6
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
