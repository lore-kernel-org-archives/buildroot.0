From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:39:50 +0200
Subject: [Buildroot] [git commit] python-asn1crypto: bump to version 0.24.0
Message-ID: <20180910154024.54E9483AFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b62171fbe506067340b7077a556457178597a910
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asn1crypto/python-asn1crypto.hash | 8 +++++---
 package/python-asn1crypto/python-asn1crypto.mk   | 5 +++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-asn1crypto/python-asn1crypto.hash b/package/python-asn1crypto/python-asn1crypto.hash
index ec5d7cfc2b..41aa602300 100644
--- a/package/python-asn1crypto/python-asn1crypto.hash
+++ b/package/python-asn1crypto/python-asn1crypto.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/asn1crypto/json, sha256 locally computed
-md5	74a8b9402625b38ef19cf3fa69ef8470  asn1crypto-0.22.0.tar.gz
-sha256	cbbadd640d3165ab24b06ef25d1dca09a3441611ac15f6a6b452474fdf0aed1a  asn1crypto-0.22.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/asn1crypto/json
+md5	de3520426e81a6581352d4366f310eb1  asn1crypto-0.24.0.tar.gz
+sha256	9d5c20441baf0cb60a4ac34cc447c6c189024b6b4c6cd7877034f4965c464e49  asn1crypto-0.24.0.tar.gz
+# Locally computed sha256 checksums
+sha256	7871ddf1918d53fd549943aad007cd4ad674b0e1da732a9aea4a79e1436d1eb5  LICENSE
diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
index 681dfd5c16..4cd30e8ca7 100644
--- a/package/python-asn1crypto/python-asn1crypto.mk
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ASN1CRYPTO_VERSION = 0.22.0
+PYTHON_ASN1CRYPTO_VERSION = 0.24.0
 PYTHON_ASN1CRYPTO_SOURCE = asn1crypto-$(PYTHON_ASN1CRYPTO_VERSION).tar.gz
-PYTHON_ASN1CRYPTO_SITE = https://pypi.python.org/packages/67/14/5d66588868c4304f804ebaff9397255f6ec5559e46724c2496e0f26e68d6
+PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/fc/f1/8db7daa71f414ddabfa056c4ef792e1461ff655c2ae2928a2b675bfed6b4
 PYTHON_ASN1CRYPTO_SETUP_TYPE = setuptools
 PYTHON_ASN1CRYPTO_LICENSE = MIT
+PYTHON_ASN1CRYPTO_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
