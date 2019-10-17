From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Oct 2019 09:50:08 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.100
Message-ID: <20191017074408.7F6B9821BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b06197ede4b006ba85ebbe7f04068f12b0f1006
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index a2b68b50e1..7b50e66a91 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2019-July/225069.html
-md5 72539626815b35159a63d45bc4c14ee6  libdrm-2.4.99.tar.bz2
-sha1 e15a3fcc2d321b03d233a245a8593abde7feefd4  libdrm-2.4.99.tar.bz2
-sha256 4dbf539c7ed25dbb2055090b77ab87508fc46be39a9379d15fed4b5517e1da5e  libdrm-2.4.99.tar.bz2
-sha512 04702eebe8dca97fac61653623804fdcb0b8b3714bdc6f5e72f0dfdce9c9524cf16f69d37aa9feac79ddc1c11939be44a216484563a612414668ea5eaeadf191  libdrm-2.4.99.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2019-October/240455.html
+md5 f47bc87e28198ba527e6b44ffdd62f65  libdrm-2.4.100.tar.bz2
+sha1 9f526909aba08b5658cfba3f7fde9385cad6f3b5  libdrm-2.4.100.tar.bz2
+sha256 c77cc828186c9ceec3e56ae202b43ee99eb932b4a87255038a80e8a1060d0a5d  libdrm-2.4.100.tar.bz2
+sha512 4d3a5556e650872944af52f49de395e0ce8ac9ac58530e39a34413e94dc56c231ee71b8b8de9fb944263515a922b3ebbf7ddfebeaaa91543c2604f9bcf561247  libdrm-2.4.100.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 64fa5c4925..f7c9205744 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.99
+LIBDRM_VERSION = 2.4.100
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
