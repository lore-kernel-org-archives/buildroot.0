From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:36:31 +0200
Subject: [Buildroot] [git commit] package/python-asn1crypto: bump to version
 1.4.0
Message-ID: <20210720200250.29EA37F898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=5bbe5979a2e2e10bc5dfb31a6486eafdf9b15a75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/wbond/asn1crypto/blob/1.4.0/changelog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asn1crypto/python-asn1crypto.hash | 6 +++---
 package/python-asn1crypto/python-asn1crypto.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-asn1crypto/python-asn1crypto.hash b/package/python-asn1crypto/python-asn1crypto.hash
index b00474bdcd..fb2da94ed5 100644
--- a/package/python-asn1crypto/python-asn1crypto.hash
+++ b/package/python-asn1crypto/python-asn1crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asn1crypto/json
-md5	daad112940181917e3ff169b47b9bd9a  asn1crypto-1.3.0.tar.gz
-sha256	5a215cb8dc12f892244e3a113fe05397ee23c5c4ca7a69cd6e69811755efc42d  asn1crypto-1.3.0.tar.gz
+md5  00bf5b72d37778e62cc73b1d8909ae27  asn1crypto-1.4.0.tar.gz
+sha256  f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c  asn1crypto-1.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a88480656ec98943fb04344f6a477ee74062896f3ddb1a6f99e5f05f0109a286  LICENSE
+sha256  a88480656ec98943fb04344f6a477ee74062896f3ddb1a6f99e5f05f0109a286  LICENSE
diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
index 2d8d384cca..af4e43b3d0 100644
--- a/package/python-asn1crypto/python-asn1crypto.mk
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASN1CRYPTO_VERSION = 1.3.0
+PYTHON_ASN1CRYPTO_VERSION = 1.4.0
 PYTHON_ASN1CRYPTO_SOURCE = asn1crypto-$(PYTHON_ASN1CRYPTO_VERSION).tar.gz
-PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/9f/3d/8beae739ed8c1c8f00ceac0ab6b0e97299b42da869e24cf82851b27a9123
+PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/6b/b4/42f0e52ac2184a8abb31f0a6f98111ceee1aac0b473cee063882436e0e09
 PYTHON_ASN1CRYPTO_SETUP_TYPE = setuptools
 PYTHON_ASN1CRYPTO_LICENSE = MIT
 PYTHON_ASN1CRYPTO_LICENSE_FILES = LICENSE
