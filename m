From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Aug 2019 20:13:01 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/gnutls: bump version to 3.6.9
Message-ID: <20190825181301.27589-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.gnupg.org/pipermail/gnutls-help/2019-July/004556.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 5ab913ad6e..0149e4a277 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.8.tar.xz.sig
-sha256	aa81944e5635de981171772857e72be231a7e0f559ae0292d2737de475383e83	gnutls-3.6.8.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.9.tar.xz.sig
+sha256	4331fca55817ecdd74450b908a6c29b4f05bb24dd13144c6284aa34d872e1fcb	gnutls-3.6.9.tar.xz
 # Locally calculated
 sha256	e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b	doc/COPYING
 sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 4f40b896ff..ecbedec5c8 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.6
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).9
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
-- 
2.20.1
