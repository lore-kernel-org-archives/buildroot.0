From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jan 2017 13:10:06 +0100
Subject: [Buildroot] [git commit] package/libgcrypt: bump to version 1.7.6
Message-ID: <20170127121332.75FBE80500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75dd0d439c7254af209305574f9c9c8d25863fac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No announcement was made for this version, so the hash was calculated locally.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.hash | 6 ++----
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 89c5719..48bbd6a 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,4 +1,2 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2016-12/msg00007.html
-sha1 fa485d854748fc06ea041b3057b2de2f12fbc17f  libgcrypt-1.7.5.tar.bz2
-# Calculated based on the hash above
-sha256 d1fea4128beef2bb30a470af6bafabccc503ced350534fb9dd8f5a53ffbae800  libgcrypt-1.7.5.tar.bz2
+# Locally calculated
+sha256  626aafee84af9d2ce253d2c143dc1c0902dda045780cc241f39970fc60be05bc  libgcrypt-1.7.6.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 48c62b4..a034358 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.7.5
+LIBGCRYPT_VERSION = 1.7.6
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
