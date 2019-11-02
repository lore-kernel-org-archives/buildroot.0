From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 10:09:44 +0100
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 6.2.1
Message-ID: <20191102090554.162018E519@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73606dad4c4a2cddca872e7c90330fe2e63efa16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix indentation if hash file, and take also md5 from PyPI.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pillow/python-pillow.hash | 9 +++++----
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index bbe026c085..990b25c46e 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,4 +1,5 @@
-# sha256 for python-pillow from https://pypi.org/project/Pillow/
-# sha256 for LICENSE locally computed
-sha256 4548236844327a718ce3bb182ab32a16fa2050c61e334e959f554cac052fb0df  Pillow-6.2.0.tar.gz
-sha256 64ea4328ed56392b423ef968519a9ad427e3de9b985862c95ed2ed4d793d22ee  LICENSE
+# md5, sha256 from https://pypi.org/pypi/pillow/json
+md5	13acde283ece6ac69f62609fa108d316  Pillow-6.2.1.tar.gz
+sha256	bf4e972a88f8841d8fdc6db1a75e0f8d763e66e3754b03006cbc3854d89f1cb1  Pillow-6.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256	64ea4328ed56392b423ef968519a9ad427e3de9b985862c95ed2ed4d793d22ee  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 3d5e54b436..895b1fcb99 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 6.2.0
+PYTHON_PILLOW_VERSION = 6.2.1
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/87/dc/7597336c48796d4a836007460148b7baf7f278ad42b73d49047eb0e8194c
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/5b/bb/cdc8086db1f15d0664dd22a62c69613cdc00f1dd430b5b19df1bea83f2a3
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
