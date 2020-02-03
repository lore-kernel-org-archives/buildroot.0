From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon,  3 Feb 2020 23:12:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/python-aioblescan: Bump to version
 0.2.6
Message-ID: <20200203221223.940456-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-aioblescan/python-aioblescan.hash | 4 ++--
 package/python-aioblescan/python-aioblescan.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aioblescan/python-aioblescan.hash b/package/python-aioblescan/python-aioblescan.hash
index d33162850a..902a7a30f8 100644
--- a/package/python-aioblescan/python-aioblescan.hash
+++ b/package/python-aioblescan/python-aioblescan.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioblescan/json
-md5	b662f44828a99430d4ed42c843ddb89c  aioblescan-0.2.4.tar.gz
-sha256	d613f24ffdb3dae48d6157443f76708f0c791034036330d00272af6b408b2c6c  aioblescan-0.2.4.tar.gz
+md5	9ad3f04ea7ad4c81a53f8e1316985527  aioblescan-0.2.6.tar.gz
+sha256	2e45c325e070a0ee4e952a7d0c56e95ad230643e1057fb5f3e95ea5c99081436  aioblescan-0.2.6.tar.gz
 # Locally computed sha256 checksums
 sha256	c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
index 8a6bda3a65..6350007c70 100644
--- a/package/python-aioblescan/python-aioblescan.mk
+++ b/package/python-aioblescan/python-aioblescan.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_AIOBLESCAN_VERSION = 0.2.4
+PYTHON_AIOBLESCAN_VERSION = 0.2.6
 PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
-PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/a9/ad/1e2f41b2036bd76079f88cd94ce35b5a996d937dccaf432ea6b8092d3e11
-PYTHON_AIOBLESCAN_SETUP_TYPE = distutils
+PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/66/b8/888c2eb4323ed498dbc7deeb8aee0cfec9edd8c25184b06a8874bb0cf84f
+PYTHON_AIOBLESCAN_SETUP_TYPE = setuptools
 PYTHON_AIOBLESCAN_LICENSE = MIT
 PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
 
-- 
2.25.0
