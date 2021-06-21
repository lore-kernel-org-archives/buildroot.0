From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 21 Jun 2021 07:47:45 +0200
Subject: [Buildroot] [PATCH 3/5] package/libksba: bump to version 1.6.0
In-Reply-To: <20210621054747.218408-1-fontaine.fabrice@gmail.com>
References: <20210621054747.218408-1-fontaine.fabrice@gmail.com>
Message-ID: <20210621054747.218408-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash of AUTHORS file (update in year:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commitdiff;h=1015bea2f8a55b965dee29e17118bc73c2deca39)

https://dev.gnupg.org/T5479

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index c8c9d6bdd7..422048be5f 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,8 +1,8 @@
 # Locally calculated after checking pgp signature
-sha256  ae4af129216b2d7fdea0b5bf2a788cd458a79c983bb09a43f4d525cc87aba0ba  libksba-1.5.0.tar.bz2
+sha256  dad683e6f2d915d880aa4bed5cea9a115690b8935b78a1bbe01669189307a48b  libksba-1.6.0.tar.bz2
 
 # Hash for license files:
-sha256  4d7ff8486176da695f3c81da2ac7ce1b9e5331e0a1667d9ebfe44057088a4220  AUTHORS
+sha256  8f1b87e551d97b2b23b6d3403a5d598c63ea89824cb8ee351f631f6cab2beaa5  AUTHORS
 sha256  6197b98c6bf69838c624809c509d84333de1bc847155168c0e84527446a27076  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING.GPLv3
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index bb02391a38..ca5fc1d749 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.5.0
+LIBKSBA_VERSION = 1.6.0
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
-- 
2.30.2
