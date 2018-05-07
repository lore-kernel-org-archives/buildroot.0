From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon,  7 May 2018 16:03:49 -0700
Subject: [Buildroot] [PATCH 1/1] python-raven: bump to version 6.7.0
Message-ID: <20180507230349.9443-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/python-raven/python-raven.hash | 6 +++---
 package/python-raven/python-raven.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-raven/python-raven.hash b/package/python-raven/python-raven.hash
index 66452a7fc1..ce21886e76 100644
--- a/package/python-raven/python-raven.hash
+++ b/package/python-raven/python-raven.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/raven/json, sha256 locally computed
-md5	4471e9e881da64f057ee7740345a6b27  raven-6.5.0.tar.gz
-sha256	84da75114739191bdf2388f296ffd6177e83567a7fbaf2701e034ad6026e4f3b  raven-6.5.0.tar.gz
+# md5, sha256 from https://pypi.python.org/pypi/raven/json
+md5	35398b2447d337315e0069c2580d3468  raven-6.7.0.tar.gz
+sha256	f908e9b39f02580e7f822030d119ed3b2e8d32300a2fec6373e5827d588bbae7  raven-6.7.0.tar.gz
 # License file, locally calculated
 sha256	5ce9459bc19ced99cc9eb135d4f559ed01e336354bdf16dd998be85aa688c233  LICENSE
diff --git a/package/python-raven/python-raven.mk b/package/python-raven/python-raven.mk
index 4a4cdee353..4aa49f5b37 100644
--- a/package/python-raven/python-raven.mk
+++ b/package/python-raven/python-raven.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RAVEN_VERSION = 6.5.0
+PYTHON_RAVEN_VERSION = 6.7.0
 PYTHON_RAVEN_SOURCE = raven-$(PYTHON_RAVEN_VERSION).tar.gz
-PYTHON_RAVEN_SITE = https://pypi.python.org/packages/e0/26/1bdd4431f59ff92fee7f2378b7d54eb175eb69f68c40c6c9b15161f6774f
+PYTHON_RAVEN_SITE = https://files.pythonhosted.org/packages/d7/54/7d199f893a0ac01f8df9b7ec39c0f3ac19146e78b33401b1f4984c9d3583
 PYTHON_RAVEN_SETUP_TYPE = setuptools
 PYTHON_RAVEN_LICENSE = BSD-3-Clause
 PYTHON_RAVEN_LICENSE_FILES = LICENSE
-- 
2.17.0
