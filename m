From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:39:54 +0200
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 6.2.0
Message-ID: <20191010204125.0B5548CA3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22be0d369745562648ada48b8c9f588f8a61381d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps python-pillow to version 6.2.0.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pillow/python-pillow.hash | 2 +-
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index fe72d01d38..bbe026c085 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,4 +1,4 @@
 # sha256 for python-pillow from https://pypi.org/project/Pillow/
 # sha256 for LICENSE locally computed
-sha256 0804f77cb1e9b6dbd37601cee11283bba39a8d44b9ddb053400c58e0c0d7d9de  Pillow-6.1.0.tar.gz
+sha256 4548236844327a718ce3bb182ab32a16fa2050c61e334e959f554cac052fb0df  Pillow-6.2.0.tar.gz
 sha256 64ea4328ed56392b423ef968519a9ad427e3de9b985862c95ed2ed4d793d22ee  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index a4121da2b4..3d5e54b436 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 6.1.0
+PYTHON_PILLOW_VERSION = 6.2.0
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/51/fe/18125dc680720e4c3086dd3f5f95d80057c41ab98326877fc7d3ff6d0ee5
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/87/dc/7597336c48796d4a836007460148b7baf7f278ad42b73d49047eb0e8194c
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
