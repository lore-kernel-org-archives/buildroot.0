From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:05:31 +0100
Subject: [Buildroot] [git commit] python-dateutil: bump to version 2.6.0
Message-ID: <20161217140816.E53868026C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f9d804d9eb393faa012417d5e5960c8cd128c48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-dateutil/python-dateutil.hash | 7 +++----
 package/python-dateutil/python-dateutil.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-dateutil/python-dateutil.hash b/package/python-dateutil/python-dateutil.hash
index 9eff016..adc24bd 100644
--- a/package/python-dateutil/python-dateutil.hash
+++ b/package/python-dateutil/python-dateutil.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/python-dateutil/json
-md5	05ffc6d2cc85a7fd93bb245807f715ef  python-dateutil-2.5.3.tar.gz
-# sha256 calculated by scanpypi
-sha256	1408fdb07c6a1fa9997567ce3fcee6a337b39a503d80699e0f213de4aa4b32ed  python-dateutil-2.5.3.tar.gz
+# md5 from https://pypi.python.org/pypi/python-dateutil/json, sha256 locally computed
+md5	6e38f91e8c94c15a79ce22768dfeca87  python-dateutil-2.6.0.tar.gz
+sha256	62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2  python-dateutil-2.6.0.tar.gz
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index 371788c..8d73d16 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATEUTIL_VERSION = 2.5.3
+PYTHON_DATEUTIL_VERSION = 2.6.0
 PYTHON_DATEUTIL_SOURCE = python-dateutil-$(PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_DATEUTIL_SITE = https://pypi.python.org/packages/3e/f5/aad82824b369332a676a90a8c0d1e608b17e740bbb6aeeebca726f17b902
+PYTHON_DATEUTIL_SITE = https://pypi.python.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3c
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
