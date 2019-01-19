From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 23:06:09 +0100
Subject: [Buildroot] [git commit] libuv: bump to version 1.25.0
Message-ID: <20190119220733.BAA3F890FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5885c7f6d8a492da0aa315e2dcc345e144526c87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index f4e9d53a86..8f11743b5a 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0d026c8f68c4d7b7c59de8f485f262ac71c24e0f3a80d740a25d20edd2f2774e  libuv-v1.24.1.tar.gz
+sha256  ce3036d444c3fb4f9a9e2994bec1f4fa07872b01456998b422ce918fdc55c254  libuv-v1.25.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 40e6bd26d6..fec6659ed9 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.24.1
+LIBUV_VERSION = v1.25.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
