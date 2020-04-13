From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 17:53:33 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 5.1.0
Message-ID: <20200413235333.64869-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing host-python-setuptools-scm dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cbor2/python-cbor2.hash | 6 +++---
 package/python-cbor2/python-cbor2.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index abc049b82e..70e16cae2d 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5	47653309cff623382c770841847dafaf  cbor2-5.0.1.tar.gz
-sha256	4299db69e5ac7b3026abb2a639737c72804511130ced81f660a9cb9222352dba  cbor2-5.0.1.tar.gz
+md5  b7c3b94ad5b78ba144ed4df9e55ce2ea  cbor2-5.1.0.tar.gz
+sha256  43ce11e8c2fe4971d386d1a60cf83bfa0a4a667b97668ba76acbf5e6398821aa  cbor2-5.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
+sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index d504e33d2d..850ee7c50d 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.0.1
+PYTHON_CBOR2_VERSION = 5.1.0
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/3e/2c/188d040bd4cf99012d0e847a3d95bf1ef1f783859b09eb9f736950af84f0
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/ee/80/bc617b7fd89855649e48eb8242e09535e1b75371ec8389313fa0f97e2a70
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
+PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.20.1
