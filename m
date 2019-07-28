From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 28 Jul 2019 17:18:47 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 6.1.0
Message-ID: <20190728151847.19494-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bump python-pillow to version 6.1.0

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pillow/python-pillow.hash | 2 +-
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index fa9caae679..fe72d01d38 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,4 +1,4 @@
 # sha256 for python-pillow from https://pypi.org/project/Pillow/
 # sha256 for LICENSE locally computed
-sha256 809c0a2ce9032cbcd7b5313f71af4bdc5c8c771cb86eb7559afd954cab82ebb5  Pillow-6.0.0.tar.gz
+sha256 0804f77cb1e9b6dbd37601cee11283bba39a8d44b9ddb053400c58e0c0d7d9de  Pillow-6.1.0.tar.gz
 sha256 64ea4328ed56392b423ef968519a9ad427e3de9b985862c95ed2ed4d793d22ee  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 6efa9f3923..a4121da2b4 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 6.0.0
+PYTHON_PILLOW_VERSION = 6.1.0
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/81/1a/6b2971adc1bca55b9a53ed1efa372acff7e8b9913982a396f3fa046efaf8
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/51/fe/18125dc680720e4c3086dd3f5f95d80057c41ab98326877fc7d3ff6d0ee5
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-- 
2.17.1
