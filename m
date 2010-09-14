From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:43 -0700
Subject: [Buildroot] [PATCH 16/21] mpfr: bump to 3.0.0
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-16-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES              |    2 +-
 package/mpfr/mpfr.mk |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9c89f65..b17b716 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,7 +10,7 @@
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
 	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, genext2fs,
 	gmp, iptables, kismet, libdeamon, libelf, libogg, libvorbis, make,
-	module-init-tools, openvpn, qt, usbutils
+	module-init-tools, mpfr, openvpn, qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index a7834dd..ebaa91c 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -3,8 +3,8 @@
 # mpfr
 #
 #############################################################
-MPFR_VERSION:=2.4.1
-MPFR_PATCH:=patches
+MPFR_VERSION:=3.0.0
+MPFR_PATCH:=allpatches
 MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
@@ -13,7 +13,7 @@ MPFR_DIR:=$(TOOLCHAIN_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_BINARY:=libmpfr$(LIBTGTEXT)
 MPFR_HOST_BINARY:=libmpfr$(HOST_LIBEXT)
-MPFR_LIBVERSION:=1.2.0
+MPFR_LIBVERSION:=4.0.0
 
 # need patch
 ifneq ($(MPFR_PATCH),)
-- 
1.7.2.3
