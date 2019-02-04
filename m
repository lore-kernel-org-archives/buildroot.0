From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  4 Feb 2019 10:58:23 +0100
Subject: [Buildroot] [PATCH 1/2] python-docker-pycreds: bump version to 0.4.0
Message-ID: <20190204095824.18792-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by newer python-docker versions.

Pypi now proves a sha256 hash as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-docker-pycreds/python-docker-pycreds.hash | 6 +++---
 package/python-docker-pycreds/python-docker-pycreds.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-docker-pycreds/python-docker-pycreds.hash b/package/python-docker-pycreds/python-docker-pycreds.hash
index 9e1182d4a4..d93a3a1d31 100644
--- a/package/python-docker-pycreds/python-docker-pycreds.hash
+++ b/package/python-docker-pycreds/python-docker-pycreds.hash
@@ -1,4 +1,4 @@
-# md5 from https://pypi.python.org/pypi/docker-pycreds/json, sha256 locally computed
-md5	ae63c7def3e58cb51a4d8f5810683030  docker-pycreds-0.2.2.tar.gz
-sha256	c7ab85de2894baff6ee8f15160cbbfa2fd3a04e56f0372c5793d24060687b299  docker-pycreds-0.2.2.tar.gz
+# md5 and sha256 from https://pypi.python.org/pypi/docker-pycreds/json
+md5	322f570cea6b4661c6ac335683988e18  docker-pycreds-0.4.0.tar.gz
+sha256	6ce3270bcaf404cc4c3e27e4b6c70d3521deae82fb508767870fdbf772d584d4  docker-pycreds-0.4.0.tar.gz
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-docker-pycreds/python-docker-pycreds.mk b/package/python-docker-pycreds/python-docker-pycreds.mk
index e7ffd0eb51..6575ada084 100644
--- a/package/python-docker-pycreds/python-docker-pycreds.mk
+++ b/package/python-docker-pycreds/python-docker-pycreds.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCKER_PYCREDS_VERSION = 0.2.2
+PYTHON_DOCKER_PYCREDS_VERSION = 0.4.0
 PYTHON_DOCKER_PYCREDS_SOURCE = docker-pycreds-$(PYTHON_DOCKER_PYCREDS_VERSION).tar.gz
-PYTHON_DOCKER_PYCREDS_SITE = https://pypi.python.org/packages/db/73/42d4c698e70633d99f7f7c4c87c6de45ead5ad7b36dcfccd998fd1556ac9
+PYTHON_DOCKER_PYCREDS_SITE = https://files.pythonhosted.org/packages/c5/e6/d1f6c00b7221e2d7c4b470132c931325c8b22c51ca62417e300f5ce16009
 PYTHON_DOCKER_PYCREDS_SETUP_TYPE = setuptools
 PYTHON_DOCKER_PYCREDS_LICENSE = Apache-2.0
 PYTHON_DOCKER_PYCREDS_LICENSE_FILES = LICENSE
-- 
2.11.0
