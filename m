From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Apr 2018 22:25:15 +0200
Subject: [Buildroot] [git commit] libuv: bump version to 1.20.2
Message-ID: <20180427202830.F2C5788EA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eddc316307dd0f7586f881bd6ad240690ce14e8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index df021c567b..899fae2817 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  abc9106789c15a1c8009ab3d114a5b44bd6e240b183240f47e28aa542eea07b4  libuv-v1.20.1.tar.gz
+sha256  a5e62a6ed3c25a712477b55ce923e7f49af95b80319f88b9c950200d65427793  libuv-v1.20.2.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 6d1a4acc01..d857d64c49 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.20.1
+LIBUV_VERSION = v1.20.2
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
