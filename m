From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 18 Sep 2010 19:53:38 -0700
Subject: [Buildroot] [PATCH 16/21] mpfr: bump to 3.0.0
In-Reply-To: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284864823-18993-17-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Btw: mpfr.org changed the link to the patch file.
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/mpfr/mpfr.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 6979a9f..865eb5c 100644
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
