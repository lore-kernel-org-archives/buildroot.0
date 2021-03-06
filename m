From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:10:49 +0100
Subject: [Buildroot] [git commit] package/python-aioblescan: bump to version
 0.2.7
Message-ID: <20210308072139.D5CFB88971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8603fcbc254b2e625c9449951bdd84bc5b97fa10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Move-README-to-reStructured-text.patch    | 35 ++++++++++++++++++++++
 package/python-aioblescan/python-aioblescan.hash   |  6 ++--
 package/python-aioblescan/python-aioblescan.mk     |  4 +--
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/package/python-aioblescan/0001-Move-README-to-reStructured-text.patch b/package/python-aioblescan/0001-Move-README-to-reStructured-text.patch
new file mode 100644
index 0000000000..3db03bd835
--- /dev/null
+++ b/package/python-aioblescan/0001-Move-README-to-reStructured-text.patch
@@ -0,0 +1,35 @@
+From 62260e0a42dd6c1c10660f68a531c49bd6cade2e Mon Sep 17 00:00:00 2001
+From: Francois Wautier <francois@wautier.eu>
+Date: Thu, 25 Feb 2021 20:07:08 +0700
+Subject: [PATCH] Move README to reStructured text
+
+Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 582a994..315b3bb 100644
+--- a/setup.py
++++ b/setup.py
+@@ -4,7 +4,7 @@ import setuptools
+ 
+ version = "0.2.7"
+ 
+-with open("README.md", "r") as fh:
++with open("README.rst", "r") as fh:
+     long_description = fh.read()
+ 
+ setuptools.setup(
+@@ -16,7 +16,7 @@ setuptools.setup(
+     author_email="francois at wautier.eu",
+     description="Scanning Bluetooth for advertised info with asyncio.",
+     long_description=long_description,
+-    long_description_content_type="text/markdown",
++    long_description_content_type="text/x-rst",
+     url="http://github.com/frawau/aioblescan",
+     keywords=["bluetooth", "advertising", "hci", "ble"],
+     license="MIT",
+-- 
+2.27.0
+
diff --git a/package/python-aioblescan/python-aioblescan.hash b/package/python-aioblescan/python-aioblescan.hash
index 902a7a30f8..99a715dcd0 100644
--- a/package/python-aioblescan/python-aioblescan.hash
+++ b/package/python-aioblescan/python-aioblescan.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioblescan/json
-md5	9ad3f04ea7ad4c81a53f8e1316985527  aioblescan-0.2.6.tar.gz
-sha256	2e45c325e070a0ee4e952a7d0c56e95ad230643e1057fb5f3e95ea5c99081436  aioblescan-0.2.6.tar.gz
+md5  fbcbf92260269d401a197636412f0c99  aioblescan-0.2.7.tar.gz
+sha256  2987f575c5129a21e42ad59e439feb3c96e0ad7210ef73af8eba1344106e5f5f  aioblescan-0.2.7.tar.gz
 # Locally computed sha256 checksums
-sha256	c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
+sha256  c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
index 6350007c70..2ace10503e 100644
--- a/package/python-aioblescan/python-aioblescan.mk
+++ b/package/python-aioblescan/python-aioblescan.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOBLESCAN_VERSION = 0.2.6
+PYTHON_AIOBLESCAN_VERSION = 0.2.7
 PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
-PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/66/b8/888c2eb4323ed498dbc7deeb8aee0cfec9edd8c25184b06a8874bb0cf84f
+PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/78/2c/c09d8f83ed6c2ca6c4f803f2e5c349698eb78b82c8d5e9302a8eed1a7480
 PYTHON_AIOBLESCAN_SETUP_TYPE = setuptools
 PYTHON_AIOBLESCAN_LICENSE = MIT
 PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
