From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  1 Nov 2019 19:04:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pylibftdi: bump to version
 0.18.0
In-Reply-To: <20191101170417.29286-1-asafka7@gmail.com>
References: <20191101170417.29286-1-asafka7@gmail.com>
Message-ID: <20191101170417.29286-10-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pylibftdi/python-pylibftdi.hash | 11 +++++------
 package/python-pylibftdi/python-pylibftdi.mk   |  4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 669913fa97..0826ee43db 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,6 +1,5 @@
-# md5, sha256 from https://pypi.python.org/pypi/pylibftdi/json
-md5  555713983cfb7a67b0c1a1418a065bbc pylibftdi-0.17.0.tar.gz
-sha256  dc615a5338c866cc1a316cabef2ea5862b75c81de9410b85a85f38a033214c8c pylibftdi-0.17.0.tar.gz
-
-# Hash for license file
-sha256  581b6a16b3aaf23c4f7caee5defa099af833a95916e57ef24d7c12f893a0c160 LICENSE.txt
+# md5, sha256 from https://pypi.org/pypi/pylibftdi/json
+md5	40e05f3bd486b7003ac90c27fdcb013a  pylibftdi-0.18.0.tar.gz
+sha256	f6655fbb6b9543bc1ed11570a18369a11402509c4375fff4aaad6f95205b333d  pylibftdi-0.18.0.tar.gz
+# Locally computed sha256 checksums
+sha256	581b6a16b3aaf23c4f7caee5defa099af833a95916e57ef24d7c12f893a0c160  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 7f1c54ebc7..c587d8e57c 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.17.0
+PYTHON_PYLIBFTDI_VERSION = 0.18.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://pypi.python.org/packages/33/30/88b80d63ad3dae29972490ed7b16d7a9ef5f70bd35748ce3ee982bf42c41
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/e6/2c/22d38c873f7c83a7b48df25744763d94e638ba2ee158d40a176748e21b60
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
-- 
2.20.1
