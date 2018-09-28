From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Sep 2018 12:13:25 +0200
Subject: [Buildroot] [git commit] python-hyperlink: bump to version 18.0.0
Message-ID: <20180928110944.1B67D8A280@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af1d3d72d99fe76a139466cc239ad35d0dd1ea8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hyperlink/Config.in             | 1 +
 package/python-hyperlink/python-hyperlink.hash | 8 +++++---
 package/python-hyperlink/python-hyperlink.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-hyperlink/Config.in b/package/python-hyperlink/Config.in
index 11ac814233..8dad0af19a 100644
--- a/package/python-hyperlink/Config.in
+++ b/package/python-hyperlink/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_HYPERLINK
 	bool "python-hyperlink"
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	help
 	  A featureful, correct URL for Python.
 
diff --git a/package/python-hyperlink/python-hyperlink.hash b/package/python-hyperlink/python-hyperlink.hash
index 565a34d16d..fcf0cc9219 100644
--- a/package/python-hyperlink/python-hyperlink.hash
+++ b/package/python-hyperlink/python-hyperlink.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/hyperlink/json, sha256 locally computed
-md5	7a86b09d80b8f0c89f6b61efa0ebaab9  hyperlink-17.3.0.tar.gz
-sha256	ddadbbdda2b94182da14be1b5d26ec3188dfdf9687b9b8c8d810f52f79b7af1a  hyperlink-17.3.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/hyperlink/json
+md5	f41a96779b324d824864696a94b24823  hyperlink-18.0.0.tar.gz
+sha256	f01b4ff744f14bc5d0a22a6b9f1525ab7d6312cb0ff967f59414bbac52f0a306  hyperlink-18.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	9577b66fb599aa5700b4981078ab0a319416a086beee646cd282aa9f33c8c74c  LICENSE
diff --git a/package/python-hyperlink/python-hyperlink.mk b/package/python-hyperlink/python-hyperlink.mk
index 7b48e36344..6681df4f90 100644
--- a/package/python-hyperlink/python-hyperlink.mk
+++ b/package/python-hyperlink/python-hyperlink.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HYPERLINK_VERSION = 17.3.0
+PYTHON_HYPERLINK_VERSION = 18.0.0
 PYTHON_HYPERLINK_SOURCE = hyperlink-$(PYTHON_HYPERLINK_VERSION).tar.gz
-PYTHON_HYPERLINK_SITE = https://pypi.python.org/packages/61/9c/69aa5d6942271961ad1fff910db77706623423d054ecb647da963efdf49a
+PYTHON_HYPERLINK_SITE = https://files.pythonhosted.org/packages/41/e1/0abd4b480ec04892b1db714560f8c855d43df81895c98506442babf3652f
 PYTHON_HYPERLINK_SETUP_TYPE = setuptools
 PYTHON_HYPERLINK_LICENSE = MIT
 PYTHON_HYPERLINK_LICENSE_FILES = LICENSE
