From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Mar 2019 18:06:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pylibftdi: bump to version
 0.17.0
Message-ID: <20190317170626.29974-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pylibftdi/python-pylibftdi.hash | 9 ++++++---
 package/python-pylibftdi/python-pylibftdi.mk   | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 54b33a1124..669913fa97 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,3 +1,6 @@
-# md5 from https://pypi.python.org/pypi/pylibftdi/json, sha256 locally computed
-md5  eaee7fb3a67f33a35a164a9628daaafe pylibftdi-0.15.0.tar.gz
-sha256  51ef08ebcc4ec3eaec2366e9648d3f8fa1b737ea507a7f3a374ac58abf148e77 pylibftdi-0.15.0.tar.gz
+# md5, sha256 from https://pypi.python.org/pypi/pylibftdi/json
+md5  555713983cfb7a67b0c1a1418a065bbc pylibftdi-0.17.0.tar.gz
+sha256  dc615a5338c866cc1a316cabef2ea5862b75c81de9410b85a85f38a033214c8c pylibftdi-0.17.0.tar.gz
+
+# Hash for license file
+sha256  581b6a16b3aaf23c4f7caee5defa099af833a95916e57ef24d7c12f893a0c160 LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 0a5887b2ee..7f1c54ebc7 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.15.0
+PYTHON_PYLIBFTDI_VERSION = 0.17.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://pypi.python.org/packages/e5/bb/d7a86dbd7685e3866ea75d21c6c726d01706fdc0aa5dc9051ce18ae65693
+PYTHON_PYLIBFTDI_SITE = https://pypi.python.org/packages/33/30/88b80d63ad3dae29972490ed7b16d7a9ef5f70bd35748ce3ee982bf42c41
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
-- 
2.14.1
