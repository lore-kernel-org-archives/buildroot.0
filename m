From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 10 May 2018 09:17:49 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to 2.4.92
Message-ID: <20180510071749.20563-1-bernd.kuhls@t-online.de>
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
index bc15ecf79f..52624b6a02 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002853.html
-md5 23d87cda92700b710a37d9b8edaa9f54  libdrm-2.4.91.tar.bz2
-sha1 44e42ce3cd41666e343ba393c73f6f1ad9fe1e74  libdrm-2.4.91.tar.bz2
-sha256 634a0ed0cc1eff06f48674b1da81aafa661a9f001e7a4f43dde81076886dc800  libdrm-2.4.91.tar.bz2
-sha512 07578c00c121ba37033db7172590e26d1545f81c242bbce2cfb7fb904bde504822c275d6468e5c5d20360d0046ae73d9b058aa0459ba35eb11927141cc998772  libdrm-2.4.91.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2018-May/176249.html
+md5 f9b00d985f82d0be6ecc20c799acc89e  libdrm-2.4.92.tar.bz2
+sha1 aad04c8e35cd3ab589ff085b20f75ba43e086647  libdrm-2.4.92.tar.bz2
+sha256 e9e48fdb4de139dc4d9880aa1473158a16ff6aff63d14341367bd30a51ff39fa  libdrm-2.4.92.tar.bz2
+sha512 9b75584d8957d298125884d490b74c0a641725d17088ba47f3dc2ec9d06519d8387eb464c024ee11712b31b17fb84e1a9a52bd4ebc7c316beb7d2f8711dc9eb2  libdrm-2.4.92.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 8f533d72d7..06b1144616 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.91
+LIBDRM_VERSION = 2.4.92
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.14.2
