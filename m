From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 21:55:12 +0100
Subject: [Buildroot] [git commit] package/libtomcrypt: add
 LIBTOMCRYPT_CPE_ID_VENDOR
Message-ID: <20210111203644.9A46D86FFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee588dbe54f5b0c6fa177aab5aa91b9b39293e5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libtom:libtomcrypt is indeed the right CPE identifier
for this package, as can be seen from:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibtom%3Alibtomcrypt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtomcrypt/libtomcrypt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index c2f1babb49..fccd4b051c 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -9,6 +9,7 @@ LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/v$(LI
 LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.xz
 LIBTOMCRYPT_LICENSE = WTFPL
 LIBTOMCRYPT_LICENSE_FILES = LICENSE
+LIBTOMCRYPT_CPE_ID_VENDOR = libtom
 LIBTOMCRYPT_INSTALL_STAGING = YES
 LIBTOMCRYPT_INSTALL_TARGET = NO # only static library
 LIBTOMCRYPT_DEPENDENCIES = libtommath
