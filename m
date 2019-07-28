From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 09:28:54 +0200
Subject: [Buildroot] [git commit] package/libuv: bump to version 1.30.1
Message-ID: <20190728072843.91D3F80450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96743fbfc2cf6b163b0c1b8158f334b94a7355e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 373c156ca5..d7f4437293 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bdde1140087ce97080ea323c3598553ece00a24ae63ac568be78bef3e97f3e25  libuv-1.29.1.tar.gz
+sha256  d85566c2c4eae7d8e2c2d27d40e728fea29f9086e98e795c5cdce1a790f43de5  libuv-1.30.1.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 17db3480e8..0825d7e390 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = 1.29.1
+LIBUV_VERSION = 1.30.1
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
