From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jun 2016 21:22:41 -0300
Subject: [Buildroot] [PATCH] libpng: bump to version 1.6.23
Message-ID: <1465950161-6731-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index e9d3674..04e8e40 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.22/
-md5	f4ca54a3d945b8678fafed168c503f3b	libpng-1.6.22.tar.xz
-sha1	e82ec5ba0e05698c221c78f70b4c5513eb40e199	libpng-1.6.22.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.23/
+md5	9b320a05ed4db1f3f0865c8a951fd9aa	libpng-1.6.23.tar.xz
+sha1	4857fb8dbd5ca7ddacc40c183e340b9ffa34a097	libpng-1.6.23.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index df2cbcd..5f469af 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.22
+LIBPNG_VERSION = 1.6.23
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
-- 
2.7.3
