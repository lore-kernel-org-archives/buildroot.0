From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:02:00 +0200
Subject: [Buildroot] [git commit] python-pyroute2: bump to version 0.5.2
Message-ID: <20180909130639.DA24D8132B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6066c991fa4b798b4107f8d79acb9663995ba016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also added license hashes.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyroute2/python-pyroute2.hash | 10 +++++++---
 package/python-pyroute2/python-pyroute2.mk   |  4 ++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index dbf09c97ac..941157fdb3 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,3 +1,7 @@
-# md5 from https://pypi.python.org/pypi/pyroute2/json, sha256 locally computed
-md5 ef4282b1401bcd07a9cf4ec0696aba24 pyroute2-0.4.13.tar.gz
-sha256 93f3d72f58b3627036427b5571f8e27c93dbb6d01372dc4c452707d6610c0a39 pyroute2-0.4.13.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyroute2/json
+md5    2f6f951e94356ae9d224f417dc6ebed2  pyroute2-0.5.2.tar.gz
+sha256 42bf74495d95a0196a74dd171357f660175aba2bfc23f9b5f63e3830ccbef9ac  pyroute2-0.5.2.tar.gz
+# Locally computed sha256
+sha256 4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache.v2
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL.v2
+sha256 e329111754f1340de20b6084cae4d264b7b4fc8fb48964173f8ee0cb7440a51c  README.license.md
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index eed8eb415b..204ff33e7f 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.4.13
+PYTHON_PYROUTE2_VERSION = 0.5.2
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://pypi.python.org/packages/91/e7/814f60e355078dc51625cd2e7e715ed4a06111ddf2ac5580f2f10e79c94a
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/18/64/33858f79b0f2b44a0af7bb42eda3d477253de5311dae1eb12b966085909f
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2 LICENSE.GPL.v2 README.license.md
 PYTHON_PYROUTE2_SETUP_TYPE = distutils
