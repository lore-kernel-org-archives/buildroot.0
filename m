From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 18:33:54 +0200
Subject: [Buildroot] [git commit] python-pysocks: bump to version 1.6.7
Message-ID: <20170712163002.29CF581F58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5beef05d1a5d399ef9b2599b78c186ed0e070144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change setup type to setuptools and use proper license file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pysocks/python-pysocks.hash | 4 ++--
 package/python-pysocks/python-pysocks.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pysocks/python-pysocks.hash b/package/python-pysocks/python-pysocks.hash
index ac0b63a..802bd37 100644
--- a/package/python-pysocks/python-pysocks.hash
+++ b/package/python-pysocks/python-pysocks.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pysocks/json, sha256 locally computed
-md5 571f4c23982fa86bf0e7a441f1b6c881 PySocks-1.6.6.tar.gz
-sha256 02419a225ff5dcfc3c9695ef8fc9b4d8cc99658e650c6d4718d4c8f451e63f41 PySocks-1.6.6.tar.gz
+md5  07007ec7ed46292dab06013f2e3af365  PySocks-1.6.7.tar.gz
+sha256  d00329f27efa157db7efe3ca26fcd69033cd61f83822461ee3f8a353b48e33cf  PySocks-1.6.7.tar.gz
diff --git a/package/python-pysocks/python-pysocks.mk b/package/python-pysocks/python-pysocks.mk
index 10c76b2..163da76 100644
--- a/package/python-pysocks/python-pysocks.mk
+++ b/package/python-pysocks/python-pysocks.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYSOCKS_VERSION = 1.6.6
+PYTHON_PYSOCKS_VERSION = 1.6.7
 PYTHON_PYSOCKS_SOURCE = PySocks-$(PYTHON_PYSOCKS_VERSION).tar.gz
-PYTHON_PYSOCKS_SITE = https://pypi.python.org/packages/fd/70/ba9982cedc9b3ed3c06934f1f46a609e0f23c7bfdf567c52a09f1296b8cb
+PYTHON_PYSOCKS_SITE = https://pypi.python.org/packages/7d/38/edca891ce16827a1de45cc347e4b6c22311eba25838b9825a5e6c48cf560
 PYTHON_PYSOCKS_LICENSE = BSD-3-Clause
-PYTHON_PYSOCKS_LICENSE_FILES = socks.py
-PYTHON_PYSOCKS_SETUP_TYPE = distutils
+PYTHON_PYSOCKS_LICENSE_FILES = LICENSE
+PYTHON_PYSOCKS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
