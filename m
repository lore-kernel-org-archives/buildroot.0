From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Mar 2018 10:35:36 +0100
Subject: [Buildroot] [git commit] libwebsockets: bump to v2.4.2
Message-ID: <20180316094337.DE5DA83628@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=710976e7481b6d9ef450655c70523c2d6163b55a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwebsockets/libwebsockets.hash | 3 ++-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 490139746f..ea7c8ca6ba 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256	e7f9eaef258e003c9ada0803a9a5636757a5bc0a58927858834fb38a87d18ad2  libwebsockets-v2.2.1.tar.gz
+sha256	73012d7fcf428dedccc816e83a63a01462e27819d5537b8e0d0c7264bfacfad6    libwebsockets-v2.4.2.tar.gz
+sha256  078fbbbeab357fc6d4f8090e95e9022fa4cb9eac1efd77b2f1387e9ccc51917a    LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index b29a2f14c7..28fd183393 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v2.2.1
+LIBWEBSOCKETS_VERSION = v2.4.2
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPL-2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
