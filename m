From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 30 Jun 2019 19:52:15 +0200
Subject: [Buildroot] [PATCH] package/python-zeroconf: bump to version 0.23.0
Message-ID: <1561917135-19132-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/jstasiak/python-zeroconf#changelog

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/python-zeroconf/python-zeroconf.hash | 4 ++--
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index 1677aff..a4239b6 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5	23124285dbdfcf3cb9cca11b98216cf7  zeroconf-0.20.0.tar.gz
-sha256	6e3f1e7b5871e3d1410ac29b9fb85aafc1e2d661ed596b07a6f84559a475efcb  zeroconf-0.20.0.tar.gz
+md5	1094639f8688f2c5b1938029877eb4f2  zeroconf-0.23.0.tar.gz
+sha256	e0c333b967c48f8b2e5cc94a1d4d28893023fb06dfd797ee384a94cdd1d0eef5  zeroconf-0.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256	bb117c0fbd7f57f64170b690285d7df07c2371b578e3b3cd3aa2e1155ef461a0  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 7000a0d..55da292 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.20.0
+PYTHON_ZEROCONF_VERSION = 0.23.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/20/d7/418ff6c684ace0f5855ec56c66cfa99ec50443c41693b91e9abcccfa096c
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/d7/25/8bbdd4857820e0cdc380c7e0c3543dc01a55247a1d831c712571783e74ec
 PYTHON_ZEROCONF_SETUP_TYPE = setuptools
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
-- 
2.7.4
