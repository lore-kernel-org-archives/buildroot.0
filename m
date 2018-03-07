From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Mar 2018 21:58:26 +0100
Subject: [Buildroot] [PATCH 01/19] package/libdrm: bump version to 2.4.91
Message-ID: <20180307205844.3240-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index b1784b4c07..bc15ecf79f 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-February/002838.html
-md5 61dcb4989c728f566e3c15c236585a17  libdrm-2.4.90.tar.bz2
-sha1 7630ba36c65433251a0494b47086fbd0b32ff7a8  libdrm-2.4.90.tar.bz2
-sha256 db37ec8f1dbaa2c192ad9903c8d0988b858ae88031e96f169bf76aaf705db68b  libdrm-2.4.90.tar.bz2
-sha512 3d32d60c44ffdcb58667d0926e6af8d375332add1f243d8b2d37567aeef4e4b26d786294aeecf46c3dea94fc002fb73756567c457300703acfc21e32ffbd458c  libdrm-2.4.90.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002853.html
+md5 23d87cda92700b710a37d9b8edaa9f54  libdrm-2.4.91.tar.bz2
+sha1 44e42ce3cd41666e343ba393c73f6f1ad9fe1e74  libdrm-2.4.91.tar.bz2
+sha256 634a0ed0cc1eff06f48674b1da81aafa661a9f001e7a4f43dde81076886dc800  libdrm-2.4.91.tar.bz2
+sha512 07578c00c121ba37033db7172590e26d1545f81c242bbce2cfb7fb904bde504822c275d6468e5c5d20360d0046ae73d9b058aa0459ba35eb11927141cc998772  libdrm-2.4.91.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 7121f06c9a..8f533d72d7 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.90
+LIBDRM_VERSION = 2.4.91
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.11.0
