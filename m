From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 22:44:42 +0200
Subject: [Buildroot] [git commit branch/next] package/imlib2: bump version
 to 1.7.1
Message-ID: <20210518201551.4637E875F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf149cd90351d9e4357830c994daf7f72f6cf7ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/imlib2/imlib2.hash | 8 ++++----
 package/imlib2/imlib2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index 68f6c91db7..3df3deffec 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.6.1/
-md5  7b3fbcb974b48822b32b326c6a47764b  imlib2-1.6.1.tar.bz2
-sha1  3b5f850e83cbb7481e33061348fb9c7a555c8c60  imlib2-1.6.1.tar.bz2
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.7.1/
+md5  98569de9b10bcb6fd5d13e4d331ddd81  imlib2-1.7.1.tar.bz2
+sha1  092c66ae0180798a4036e68c68d7f316de192e36  imlib2-1.7.1.tar.bz2
 
 # Locally computed
-sha256  4d393a77e13da883c8ee2da3b029da3570210fe37d000c9ac33d9fce751b166d  imlib2-1.6.1.tar.bz2
+sha256  033a6a639dcbc8e03f65ff05e57068e7346d50ee2f2fff304bb9095a1b2bc407  imlib2-1.7.1.tar.bz2
 sha256  fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
 sha256  8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index a88558575d..6d973827dc 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.6.1
+IMLIB2_VERSION = 1.7.1
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
