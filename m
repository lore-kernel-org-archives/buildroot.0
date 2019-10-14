From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 14 Oct 2019 22:12:16 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-asn1crypto: bump to version
 1.1.0
Message-ID: <20191014191228.13432-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-asn1crypto/python-asn1crypto.hash | 4 ++--
 package/python-asn1crypto/python-asn1crypto.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asn1crypto/python-asn1crypto.hash b/package/python-asn1crypto/python-asn1crypto.hash
index 3fa4ec8092..d57c094e6e 100644
--- a/package/python-asn1crypto/python-asn1crypto.hash
+++ b/package/python-asn1crypto/python-asn1crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asn1crypto/json
-md5	cf33950b47b5148e29f1d62a6b6c009b  asn1crypto-1.0.1.tar.gz
-sha256	0b199f211ae690df3db4fd6c1c4ff976497fb1da689193e368eedbadc53d9292  asn1crypto-1.0.1.tar.gz
+md5	2c50b5d24677ea2ac2e232dcd1abf340  asn1crypto-1.1.0.tar.gz
+sha256	5abe83e773026162e4869f4ac16edf7554f661e8cc0bb6d2be3bc6915456731b  asn1crypto-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256	a88480656ec98943fb04344f6a477ee74062896f3ddb1a6f99e5f05f0109a286  LICENSE
diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
index 804da53984..1e1a8bd646 100644
--- a/package/python-asn1crypto/python-asn1crypto.mk
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASN1CRYPTO_VERSION = 1.0.1
+PYTHON_ASN1CRYPTO_VERSION = 1.1.0
 PYTHON_ASN1CRYPTO_SOURCE = asn1crypto-$(PYTHON_ASN1CRYPTO_VERSION).tar.gz
-PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/d1/e2/c518f2bc5805668803ebf0659628b0e9d77ca981308c7e9e5564b30b8337
+PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/04/20/ac105ae01c29580ebff75bbf1effb69d788bfa54a8336a8f14399b09e2e1
 PYTHON_ASN1CRYPTO_SETUP_TYPE = setuptools
 PYTHON_ASN1CRYPTO_LICENSE = MIT
 PYTHON_ASN1CRYPTO_LICENSE_FILES = LICENSE
-- 
2.20.1
