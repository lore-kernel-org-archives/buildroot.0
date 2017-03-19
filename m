From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 21:27:28 +0100
Subject: [Buildroot] [git commit] package/libgpg-error: bump version to 1.27
Message-ID: <20170319204703.ACC7381E95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53a5810bb961c01e82a560ecf040b61000d5cf94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpg-error/libgpg-error.hash | 2 +-
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index dac36db..0541d23 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  3df7432dc17ef66c764c3fc4a1d309a9b4a0485c914ecfdb61b71e9bf45fd930  libgpg-error-1.26.tar.gz
+sha256 04bdc7fd12001c797cc689b007fe24909f55aa0ee1d6d6aef967d9eebf5b2461  libgpg-error-1.27.tar.gz
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 5126c0a..074ebb7 100644
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
