From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 12:14:50 +0100
Subject: [Buildroot] [git commit] libuv: bump to version 1.19.1
Message-ID: <20180122111549.1D4E383EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87fcd68f8a8ee7e382e4b6efefbf91296ade833b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 3 ++-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 748e1d2..cc5a30a 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  fe53b53eee3b15db8ae1b25cbfb8740944273e02f5ccd731b176800e2807d832  libuv-v1.16.0.tar.gz
+sha256  8d96a6230af4f9f33d6ec021b599e157279a2af72ed38cf4a8c25e6d58d952ef  libuv-v1.19.1.tar.gz
+sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index bbb4282..2666c14 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.16.0
+LIBUV_VERSION = v1.19.1
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
