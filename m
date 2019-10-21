From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 19:09:38 +0200
Subject: [Buildroot] [git commit] package/python-asn1crypyo: bump to version
 1.2.0
Message-ID: <20191021170447.4E00B83687@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c28de26c30e3a6c37676321c82c694f36b707acb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asn1crypto/python-asn1crypto.hash | 4 ++--
 package/python-asn1crypto/python-asn1crypto.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asn1crypto/python-asn1crypto.hash b/package/python-asn1crypto/python-asn1crypto.hash
index d57c094e6e..d2c8487b83 100644
--- a/package/python-asn1crypto/python-asn1crypto.hash
+++ b/package/python-asn1crypto/python-asn1crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asn1crypto/json
-md5	2c50b5d24677ea2ac2e232dcd1abf340  asn1crypto-1.1.0.tar.gz
-sha256	5abe83e773026162e4869f4ac16edf7554f661e8cc0bb6d2be3bc6915456731b  asn1crypto-1.1.0.tar.gz
+md5	fc3815cdd4812505e3ee297740c5f5d3  asn1crypto-1.2.0.tar.gz
+sha256	87620880a477123e01177a1f73d0f327210b43a3cdbd714efcd2fa49a8d7b384  asn1crypto-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256	a88480656ec98943fb04344f6a477ee74062896f3ddb1a6f99e5f05f0109a286  LICENSE
diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
index 1e1a8bd646..43d3842ff6 100644
--- a/package/python-asn1crypto/python-asn1crypto.mk
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASN1CRYPTO_VERSION = 1.1.0
+PYTHON_ASN1CRYPTO_VERSION = 1.2.0
 PYTHON_ASN1CRYPTO_SOURCE = asn1crypto-$(PYTHON_ASN1CRYPTO_VERSION).tar.gz
-PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/04/20/ac105ae01c29580ebff75bbf1effb69d788bfa54a8336a8f14399b09e2e1
+PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/c1/a9/86bfedaf41ca590747b4c9075bc470d0b2ec44fb5db5d378bc61447b3b6b
 PYTHON_ASN1CRYPTO_SETUP_TYPE = setuptools
 PYTHON_ASN1CRYPTO_LICENSE = MIT
 PYTHON_ASN1CRYPTO_LICENSE_FILES = LICENSE
