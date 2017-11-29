From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Nov 2017 17:36:28 +0100
Subject: [Buildroot] [git commit] gnutls: bump to version 3.5.16
Message-ID: <20171201205339.C09C280AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a34d965af7d9e0799dc4227226ee2741e98ea483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add link to tarball signature.

Add license hashes.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 6 +++++-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 608ccf8..9ec366f 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	4aa12dec92f42a0434df794aca3d02f6f2a35b47b48c01252de65f355c051bda	gnutls-3.5.14.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.5/gnutls-3.5.16.tar.xz.sig
+sha256	0924dec90c37c05f49fec966eba3672dab4d336d879e5c06e06e13325cbfec25	gnutls-3.5.16.tar.xz
+# Locally calculated
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	doc/COPYING
+sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index b00bd13..3559086 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.5
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).14
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).16
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
