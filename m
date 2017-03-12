From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Mar 2017 12:33:24 +0100
Subject: [Buildroot] [PATCH 1/5] package/libgpg-error: bump version to 1.27
Message-ID: <20170312113328.5745-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libgpg-error/libgpg-error.hash | 2 +-
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index dac36db09..0541d2311 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  3df7432dc17ef66c764c3fc4a1d309a9b4a0485c914ecfdb61b71e9bf45fd930  libgpg-error-1.26.tar.gz
+sha256 04bdc7fd12001c797cc689b007fe24909f55aa0ee1d6d6aef967d9eebf5b2461  libgpg-error-1.27.tar.gz
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 5126c0a81..074ebb733 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.26
+LIBGPG_ERROR_VERSION = 1.27
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_LICENSE = GPLv2+, LGPLv2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.11.0
