From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jan 2018 22:13:18 +0100
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.5.17
Message-ID: <20180125211318.23402-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 9ec366f781..173cb40683 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.5/gnutls-3.5.16.tar.xz.sig
-sha256	0924dec90c37c05f49fec966eba3672dab4d336d879e5c06e06e13325cbfec25	gnutls-3.5.16.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.5/gnutls-3.5.17.tar.xz.sig
+sha256	86b142afef587c118d63f72ccf307f3321dbc40357aae528202b65d913d20919	gnutls-3.5.17.tar.xz
 # Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	doc/COPYING
 sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 3559086c61..1ce7a742e3 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.5
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).16
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).17
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
-- 
2.11.0
