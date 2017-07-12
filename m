From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 18:33:53 +0200
Subject: [Buildroot] [git commit] python-markupsafe: bump to version 1.0
Message-ID: <20170712163001.F0B2C81E46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4eacab9b3d9e7cd6f275f05df208f1336072f8b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-markupsafe/python-markupsafe.hash | 6 +++---
 package/python-markupsafe/python-markupsafe.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index 448252b..4226a1d 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f5ab3deee4c37cd6a922fb81e730da6e, sha256 locally computed
-md5	f5ab3deee4c37cd6a922fb81e730da6e  MarkupSafe-0.23.tar.gz
-sha256	a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3  MarkupSafe-0.23.tar.gz
+# md5 from https://pypi.python.org/pypi/markupsafe/json, sha256 locally computed
+md5	2fcedc9284d50e577b5192e8e3578355  MarkupSafe-1.0.tar.gz
+sha256	a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665  MarkupSafe-1.0.tar.gz
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index d8e3acb..625a9b5 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 0.23
+PYTHON_MARKUPSAFE_VERSION = 1.0
 PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = http://pypi.python.org/packages/source/M/MarkupSafe
+PYTHON_MARKUPSAFE_SITE = https://pypi.python.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE
