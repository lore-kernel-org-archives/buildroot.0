From: Christian Kellermann <christian.kellermann@solectrix.de>
Date: Tue, 10 Dec 2019 11:43:12 +0100
Subject: [Buildroot] [PATCH] package/python-pylibftdi: bump version to 0.18.1
Message-ID: <20191210104312.548521-1-christian.kellermann@solectrix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
---
 package/python-pylibftdi/python-pylibftdi.hash | 4 ++--
 package/python-pylibftdi/python-pylibftdi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 0826ee43db..ead3c9652a 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5	40e05f3bd486b7003ac90c27fdcb013a  pylibftdi-0.18.0.tar.gz
-sha256	f6655fbb6b9543bc1ed11570a18369a11402509c4375fff4aaad6f95205b333d  pylibftdi-0.18.0.tar.gz
+md5	c48e442cef7b1e865b4d96ab92f509ad pylibftdi-0.18.1.tar.gz
+sha256	bdd04076933959b20b3c8b4fb8be7882d3362675f259e7eeb23ebff03b81859d  pylibftdi-0.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256	581b6a16b3aaf23c4f7caee5defa099af833a95916e57ef24d7c12f893a0c160  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index c587d8e57c..2f5614867d 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.18.0
+PYTHON_PYLIBFTDI_VERSION = 0.18.1
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/e6/2c/22d38c873f7c83a7b48df25744763d94e638ba2ee158d40a176748e21b60
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/50/9b/1e1cdb9715bacfb83e5eaf5e69f4e2fbd92d61f43c5e185cc3935ec01b28
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
-- 
2.23.0
