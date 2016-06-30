From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:02:20 +0200
Subject: [Buildroot] [git commit] python-pysocks: bump to version 1.5.7
Message-ID: <20160630220236.51EEA8047F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46b2dee6fcc8883fa439df03e188feef7b547b14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pysocks/python-pysocks.hash | 6 +++---
 package/python-pysocks/python-pysocks.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pysocks/python-pysocks.hash b/package/python-pysocks/python-pysocks.hash
index 9388c42..556996a 100644
--- a/package/python-pysocks/python-pysocks.hash
+++ b/package/python-pysocks/python-pysocks.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=c825c7c52b2c79dde73cac8d04bd25cb, sha256 locally computed
-md5     c825c7c52b2c79dde73cac8d04bd25cb  PySocks-1.5.6.tar.gz
-sha256  a62b35b13968ba3642a973d115ae6a11be886b5f5ae0841a3ecad4b4f1d7deb1  PySocks-1.5.6.tar.gz
+# md5 from https://pypi.python.org/pypi/PySocks/json, sha256 locally computed
+md5     68f4ad7a8d4fa725656ae3e9dd142d29  PySocks-1.5.7.tar.gz
+sha256  e51c7694b10288e6fd9a28e15c0bcce9aca0327e7b32ebcd9af05fcd56f38b88  PySocks-1.5.7.tar.gz
diff --git a/package/python-pysocks/python-pysocks.mk b/package/python-pysocks/python-pysocks.mk
index a556ced..a99a399 100644
--- a/package/python-pysocks/python-pysocks.mk
+++ b/package/python-pysocks/python-pysocks.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSOCKS_VERSION = 1.5.6
+PYTHON_PYSOCKS_VERSION = 1.5.7
 PYTHON_PYSOCKS_SOURCE = PySocks-$(PYTHON_PYSOCKS_VERSION).tar.gz
-PYTHON_PYSOCKS_SITE = https://pypi.python.org/packages/source/P/PySocks
+PYTHON_PYSOCKS_SITE = https://pypi.python.org/packages/16/56/9b3513078f837fa8cb88ee01ec1cd805ed8104a37bc02ca8c2588ae8fe5a
 PYTHON_PYSOCKS_LICENSE = BSD-3c
 PYTHON_PYSOCKS_LICENSE_FILES = socks.py
 PYTHON_PYSOCKS_SETUP_TYPE = distutils
