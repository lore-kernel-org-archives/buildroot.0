From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:19:51 +0100
Subject: [Buildroot] [git commit branch/next] package/python-asn1crypto:
 bump to version 1.3.0
Message-ID: <20200227100041.2A9D58ED13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02c16cf69107faa3cf36bc47ac38c5c38b1fbfcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asn1crypto/python-asn1crypto.hash | 4 ++--
 package/python-asn1crypto/python-asn1crypto.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asn1crypto/python-asn1crypto.hash b/package/python-asn1crypto/python-asn1crypto.hash
index d2c8487b83..b00474bdcd 100644
--- a/package/python-asn1crypto/python-asn1crypto.hash
+++ b/package/python-asn1crypto/python-asn1crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asn1crypto/json
-md5	fc3815cdd4812505e3ee297740c5f5d3  asn1crypto-1.2.0.tar.gz
-sha256	87620880a477123e01177a1f73d0f327210b43a3cdbd714efcd2fa49a8d7b384  asn1crypto-1.2.0.tar.gz
+md5	daad112940181917e3ff169b47b9bd9a  asn1crypto-1.3.0.tar.gz
+sha256	5a215cb8dc12f892244e3a113fe05397ee23c5c4ca7a69cd6e69811755efc42d  asn1crypto-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256	a88480656ec98943fb04344f6a477ee74062896f3ddb1a6f99e5f05f0109a286  LICENSE
diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
index 43d3842ff6..2d8d384cca 100644
--- a/package/python-asn1crypto/python-asn1crypto.mk
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASN1CRYPTO_VERSION = 1.2.0
+PYTHON_ASN1CRYPTO_VERSION = 1.3.0
 PYTHON_ASN1CRYPTO_SOURCE = asn1crypto-$(PYTHON_ASN1CRYPTO_VERSION).tar.gz
-PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/c1/a9/86bfedaf41ca590747b4c9075bc470d0b2ec44fb5db5d378bc61447b3b6b
+PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/9f/3d/8beae739ed8c1c8f00ceac0ab6b0e97299b42da869e24cf82851b27a9123
 PYTHON_ASN1CRYPTO_SETUP_TYPE = setuptools
 PYTHON_ASN1CRYPTO_LICENSE = MIT
 PYTHON_ASN1CRYPTO_LICENSE_FILES = LICENSE
