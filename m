From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jul 2018 18:31:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: bump version to 3.5.19
Message-ID: <20180721163155.19273-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.gnupg.org/pipermail/gnutls-devel/2018-July/008583.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index be2913e00f..0c6c014da0 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.5/gnutls-3.5.18.tar.xz.sig
-sha256	ae2248d9e78747cf9c469dde81ff8f90b56838b707a0637f3f7d4eee90e80234	gnutls-3.5.18.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.5/gnutls-3.5.19.tar.xz.sig
+sha256 1936eb64f03aaefd6eb16cef0567457777618573826b94d03376bb6a4afadc44  gnutls-3.5.19.tar.xz
 # Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	doc/COPYING
 sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index fec07dfe03..18af684376 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.5
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).18
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).19
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
-- 
2.18.0
