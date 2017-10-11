From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 22:01:35 +0200
Subject: [Buildroot] [git commit] libtomcrypt: bump to version 1.18.0
Message-ID: <20171011195744.0E74381144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=123f2e60769ff848d19754d541182a13dc2a52a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtomcrypt/libtomcrypt.hash | 2 +-
 package/libtomcrypt/libtomcrypt.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libtomcrypt/libtomcrypt.hash b/package/libtomcrypt/libtomcrypt.hash
index 562016d..6f7720e 100644
--- a/package/libtomcrypt/libtomcrypt.hash
+++ b/package/libtomcrypt/libtomcrypt.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  e33b47d77a495091c8703175a25c8228aff043140b2554c08a3c3cd71f79d116  crypt-1.17.tar.bz2
+sha256  da9df56a314afaab71963aa71bb6a075ea6bdee3d4db4af045f6bfe23e88b87a  crypt-1.18.0.tar.xz
diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index 8cc02b2..02610f1 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBTOMCRYPT_VERSION = 1.17
-LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/$(LIBTOMCRYPT_VERSION)
-LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.bz2
+LIBTOMCRYPT_VERSION = 1.18.0
+LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/v$(LIBTOMCRYPT_VERSION)
+LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.xz
 LIBTOMCRYPT_LICENSE = WTFPL
 LIBTOMCRYPT_LICENSE_FILES = LICENSE
 LIBTOMCRYPT_INSTALL_STAGING = YES
