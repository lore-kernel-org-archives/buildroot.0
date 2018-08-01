From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Aug 2018 07:39:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.93
Message-ID: <20180801053928.19246-1-bernd.kuhls@t-online.de>
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
index 52624b6a02..2043ee780e 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2018-May/176249.html
-md5 f9b00d985f82d0be6ecc20c799acc89e  libdrm-2.4.92.tar.bz2
-sha1 aad04c8e35cd3ab589ff085b20f75ba43e086647  libdrm-2.4.92.tar.bz2
-sha256 e9e48fdb4de139dc4d9880aa1473158a16ff6aff63d14341367bd30a51ff39fa  libdrm-2.4.92.tar.bz2
-sha512 9b75584d8957d298125884d490b74c0a641725d17088ba47f3dc2ec9d06519d8387eb464c024ee11712b31b17fb84e1a9a52bd4ebc7c316beb7d2f8711dc9eb2  libdrm-2.4.92.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2018-August/185041.html
+md5 0ba45ad1551b2c1b6df0797a3e65f827  libdrm-2.4.93.tar.bz2
+sha1 550ba4bb50236fc2e9138cbeadcb4942ce09410e  libdrm-2.4.93.tar.bz2
+sha256 6e84d1dc9548a76f20b59a85cf80a0b230cd8196084f5243469d9e65354fcd3c  libdrm-2.4.93.tar.bz2
+sha512 ba4221e8d6a3a9872fb6d30a0ea391e30ea0e17f249c66f067bed9c2161ed1ad8083959cb2c212834c6566c3e025f4daae31e9533d77aae19bbbbb9de6c2ab3d  libdrm-2.4.93.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 06b1144616..1871488284 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.92
+LIBDRM_VERSION = 2.4.93
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.18.0
