From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Apr 2021 00:43:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-zeroconf: bump to version
 0.29.0
Message-ID: <20210409224356.3869223-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://github.com/jstasiak/python-zeroconf/tree/0.29.0#changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-zeroconf/python-zeroconf.hash | 6 +++---
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index a4239b6780..be91b59048 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5	1094639f8688f2c5b1938029877eb4f2  zeroconf-0.23.0.tar.gz
-sha256	e0c333b967c48f8b2e5cc94a1d4d28893023fb06dfd797ee384a94cdd1d0eef5  zeroconf-0.23.0.tar.gz
+md5  98e683a247fe9915a5d4845c38b37ff3  zeroconf-0.29.0.tar.gz
+sha256  7aefbb658b452b1fd7e51124364f938c6f5e42d6ea893fa2557bea8c06c540af  zeroconf-0.29.0.tar.gz
 # Locally computed sha256 checksums
-sha256	bb117c0fbd7f57f64170b690285d7df07c2371b578e3b3cd3aa2e1155ef461a0  COPYING
+sha256  bb117c0fbd7f57f64170b690285d7df07c2371b578e3b3cd3aa2e1155ef461a0  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 55da292b46..67bfa72e03 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.23.0
+PYTHON_ZEROCONF_VERSION = 0.29.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/d7/25/8bbdd4857820e0cdc380c7e0c3543dc01a55247a1d831c712571783e74ec
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/ca/77/eb6137997adc60811c6c46b28b00abac5c16daf14383f61d8a0180326b38
 PYTHON_ZEROCONF_SETUP_TYPE = setuptools
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
-- 
2.30.2
