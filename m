From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 26 Apr 2019 22:44:48 +0200
Subject: [Buildroot] [PATCH v2] package/python-pillow: bump to version 6.0.0
Message-ID: <1556311488-27139-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps python-pillow to version 6.0.0.
Hash for LICENSE file is changed cause a copyright year update.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1 -> v2: fixing license hash
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 0f90a0b..fa9caae 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,4 +1,4 @@
-# sha256 for python-pillow from https://pypi.org/project/Pillow/5.2.0/#files
+# sha256 for python-pillow from https://pypi.org/project/Pillow/
 # sha256 for LICENSE locally computed
-sha256 f8b3d413c5a8f84b12cd4c5df1d8e211777c9852c6be3ee9c094b626644d3eab  Pillow-5.2.0.tar.gz
-sha256 4960fc18becc286be839c8ff17bd70cd5222533f761129142153443718a25199  LICENSE
+sha256 809c0a2ce9032cbcd7b5313f71af4bdc5c8c771cb86eb7559afd954cab82ebb5  Pillow-6.0.0.tar.gz
+sha256 64ea4328ed56392b423ef968519a9ad427e3de9b985862c95ed2ed4d793d22ee  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index c3a3d13..6efa9f3 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 5.2.0
+PYTHON_PILLOW_VERSION = 6.0.0
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/d3/c4/b45b9c0d549f482dd072055e2d3ced88f3b977f7b87c7a990228b20e7da1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/81/1a/6b2971adc1bca55b9a53ed1efa372acff7e8b9913982a396f3fa046efaf8
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-- 
2.7.4
