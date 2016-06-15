From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 09:43:50 +0200
Subject: [Buildroot] [git commit] libpng: bump to version 1.6.23
Message-ID: <20160615074639.A1C3881FD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d988e8f54373a6e3376f5057111b43730112943
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
