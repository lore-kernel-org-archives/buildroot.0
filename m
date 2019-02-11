From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 09:11:12 +0100
Subject: [Buildroot] [git commit branch/next] package/libuv: bump to version
 1.26.0
Message-ID: <20190211080940.9EE68821E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d01704cff25d956dc03523ea65b9eefc98db9db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 8f11743b5a..e0a217c625 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ce3036d444c3fb4f9a9e2994bec1f4fa07872b01456998b422ce918fdc55c254  libuv-v1.25.0.tar.gz
+sha256  e414cf74615b7dae768f0f5667092f1d4975f5067c087bcbe0641e241ebe4693  libuv-v1.26.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index fec6659ed9..4ab7f754ff 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.25.0
+LIBUV_VERSION = v1.26.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
