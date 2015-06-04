From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jun 2015 23:06:55 +0200
Subject: [Buildroot] [git commit] libpng: bump to version 1.6.17
Message-ID: <20150604211320.6AC0A7F932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65b25d11df7b3f17121a28e486fbec3a14fdfdb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.hash |    6 +++---
 package/libpng/libpng.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index d0027c7..dd4af06 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.16/
-md5	23b7286b5d4a86de950fd2ffc5cac742	libpng-1.6.16.tar.xz
-sha1	31855a8438ae795d249574b0da15b34eb0922e13	libpng-1.6.16.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.17/
+md5	430a9b76b78533235cd4b9b26ce75c7e	libpng-1.6.17.tar.xz
+sha1	6394f3c0847c3b9ea69f4f972dddae3786592050	libpng-1.6.17.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 2f53a95..08d8196 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.16
+LIBPNG_VERSION = 1.6.17
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
