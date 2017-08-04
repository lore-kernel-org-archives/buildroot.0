From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  3 Aug 2017 21:29:07 -0400
Subject: [Buildroot] [PATCH 1/1] python-cryptography: bump to version 2.0.2
Message-ID: <20170804012907.8668-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-cryptography/python-cryptography.hash | 4 ++--
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index a1162cf88..51ca6cb8c 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/cryptography/json, sha256 locally computed
-md5 fade66de437392ed1ba6980768626204 cryptography-1.7.2.tar.gz
-sha256 878cb68b3da3d493ffd68f36db11c29deee623671d3287c3f8d685117ffda9a9 cryptography-1.7.2.tar.gz
+md5 170fd846e78a4603febf40d55b605301 cryptography-2.0.2.tar.gz
+sha256 3780b2663ee7ebb37cb83263326e3cd7f8b2ea439c448539d4b87de12c8d06ab cryptography-2.0.2.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 5373da820..69b568cd5 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 1.7.2
+PYTHON_CRYPTOGRAPHY_VERSION = 2.0.2
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/99/df/71c7260003f5c469cec3db4c547115df39e9ce6c719a99e067ba0e78fd8a
+PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/0a/23/ffee389a45f752dc745706cdb2d354b91ddb71594506fac45236cf67af49
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.13.3
