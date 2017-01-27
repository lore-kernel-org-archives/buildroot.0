From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jan 2017 13:12:31 +0100
Subject: [Buildroot] [git commit] package/libgpg-error: bump to version 1.26
Message-ID: <20170127121332.82ABC82119@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24734c5dcb565c59a48fe398fea9e1422c4d2618
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpg-error/libgpg-error.hash | 2 +-
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 85d433d..dac36db 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 88cb2d2370f8378fd38452b99dc1419a80fd5897739b7198a4a7996364507803  libgpg-error-1.24.tar.gz
+sha256  3df7432dc17ef66c764c3fc4a1d309a9b4a0485c914ecfdb61b71e9bf45fd930  libgpg-error-1.26.tar.gz
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 1945673..5126c0a 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.24
+LIBGPG_ERROR_VERSION = 1.26
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_LICENSE = GPLv2+, LGPLv2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
