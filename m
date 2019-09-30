From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:33 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to version
 3.1.6
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-7-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-bitstring/python-bitstring.hash | 7 +++++--
 package/python-bitstring/python-bitstring.mk   | 6 +++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index 52630e0aa8..07586d5300 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,2 +1,5 @@
-# Locally computed:
-sha256	b769620c1b52d6c1548c6c4f055613f4eee3120ed8a5cff4ba4ffbbc8a582286  bitstring-3.1.5.tar.gz
+# md5, sha256 from https://pypi.org/pypi/bitstring/json
+md5	38372014dd629be75c3a0ff7d799aa3f  bitstring-3.1.6.tar.gz
+sha256	c97a8e2a136e99b523b27da420736ae5cb68f83519d633794a6a11192f69f8bf  bitstring-3.1.6.tar.gz
+# Locally computed sha256 checksums
+sha256	2e97cff64585d7cb66190ad298e9d77fd791e8b91bcc97967fa743edf8c2ba1b  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index 2c8fb9959e..636ae0e0c0 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 3.1.5
+PYTHON_BITSTRING_VERSION = 3.1.6
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://github.com/scott-griffiths/bitstring/archive
-PYTHON_BITSTRING_SETUP_TYPE = distutils
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/f4/87/fe6f7093088f4396e84c1b5d5dfb08c4840487ad46ff4805b7008c8f5ffc
+PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
 
-- 
2.20.1
