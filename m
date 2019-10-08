From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  8 Oct 2019 16:08:05 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-asn1crypto: bump to version
 1.0.1
In-Reply-To: <20191008130810.27342-1-asafka7@gmail.com>
References: <20191008130810.27342-1-asafka7@gmail.com>
Message-ID: <20191008130810.27342-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license hash (year bump on license file).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-asn1crypto/python-asn1crypto.hash | 6 +++---
 package/python-asn1crypto/python-asn1crypto.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-asn1crypto/python-asn1crypto.hash b/package/python-asn1crypto/python-asn1crypto.hash
index 41aa602300..3fa4ec8092 100644
--- a/package/python-asn1crypto/python-asn1crypto.hash
+++ b/package/python-asn1crypto/python-asn1crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asn1crypto/json
-md5	de3520426e81a6581352d4366f310eb1  asn1crypto-0.24.0.tar.gz
-sha256	9d5c20441baf0cb60a4ac34cc447c6c189024b6b4c6cd7877034f4965c464e49  asn1crypto-0.24.0.tar.gz
+md5	cf33950b47b5148e29f1d62a6b6c009b  asn1crypto-1.0.1.tar.gz
+sha256	0b199f211ae690df3db4fd6c1c4ff976497fb1da689193e368eedbadc53d9292  asn1crypto-1.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	7871ddf1918d53fd549943aad007cd4ad674b0e1da732a9aea4a79e1436d1eb5  LICENSE
+sha256	a88480656ec98943fb04344f6a477ee74062896f3ddb1a6f99e5f05f0109a286  LICENSE
diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
index 4cd30e8ca7..804da53984 100644
--- a/package/python-asn1crypto/python-asn1crypto.mk
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASN1CRYPTO_VERSION = 0.24.0
+PYTHON_ASN1CRYPTO_VERSION = 1.0.1
 PYTHON_ASN1CRYPTO_SOURCE = asn1crypto-$(PYTHON_ASN1CRYPTO_VERSION).tar.gz
-PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/fc/f1/8db7daa71f414ddabfa056c4ef792e1461ff655c2ae2928a2b675bfed6b4
+PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/d1/e2/c518f2bc5805668803ebf0659628b0e9d77ca981308c7e9e5564b30b8337
 PYTHON_ASN1CRYPTO_SETUP_TYPE = setuptools
 PYTHON_ASN1CRYPTO_LICENSE = MIT
 PYTHON_ASN1CRYPTO_LICENSE_FILES = LICENSE
-- 
2.20.1
