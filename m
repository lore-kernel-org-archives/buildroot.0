From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:49:48 +0200
Subject: [Buildroot] [git commit] package/python-hyperframe: bump to version
 5.2.0
Message-ID: <20191005204553.6379F88F54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=301c1edb2bc7af7a4789955c91dcefa103ab818f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hyperframe/python-hyperframe.hash | 8 +++++---
 package/python-hyperframe/python-hyperframe.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-hyperframe/python-hyperframe.hash b/package/python-hyperframe/python-hyperframe.hash
index e6139374ec..3e686a4aa2 100644
--- a/package/python-hyperframe/python-hyperframe.hash
+++ b/package/python-hyperframe/python-hyperframe.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/hyperframe/json, sha256 locally computed
-md5	c2aa71dd091836e72d2c6784d1dd1591  hyperframe-5.1.0.tar.gz
-sha256	a25944539db36d6a2e47689e7915dcee562b3f8d10c6cdfa0d53c91ed692fb04  hyperframe-5.1.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/hyperframe/json
+md5	6919183242feb26d8bce3b4cba81defd  hyperframe-5.2.0.tar.gz
+sha256	a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f  hyperframe-5.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256	763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
diff --git a/package/python-hyperframe/python-hyperframe.mk b/package/python-hyperframe/python-hyperframe.mk
index 8d0688f6bd..7640ade5fd 100644
--- a/package/python-hyperframe/python-hyperframe.mk
+++ b/package/python-hyperframe/python-hyperframe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HYPERFRAME_VERSION = 5.1.0
+PYTHON_HYPERFRAME_VERSION = 5.2.0
 PYTHON_HYPERFRAME_SOURCE = hyperframe-$(PYTHON_HYPERFRAME_VERSION).tar.gz
-PYTHON_HYPERFRAME_SITE = https://pypi.python.org/packages/a4/59/dddaddc73b4d53e9649850998e23b6daca80817c5442465a12423235d20b
+PYTHON_HYPERFRAME_SITE = https://files.pythonhosted.org/packages/e6/7f/9a4834af1010dc1d570d5f394dfd9323a7d7ada7d25586bd299fc4cb0356
 PYTHON_HYPERFRAME_SETUP_TYPE = setuptools
 PYTHON_HYPERFRAME_LICENSE = MIT
 PYTHON_HYPERFRAME_LICENSE_FILES = LICENSE
