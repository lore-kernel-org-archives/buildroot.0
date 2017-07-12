From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 12 Jul 2017 16:41:29 +0200
Subject: [Buildroot] [PATCH 2/4] python-markupsafe: bump to version 1.0
In-Reply-To: <20170712144131.26364-1-yegorslists@googlemail.com>
References: <20170712144131.26364-1-yegorslists@googlemail.com>
Message-ID: <20170712144131.26364-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-markupsafe/python-markupsafe.hash | 6 +++---
 package/python-markupsafe/python-markupsafe.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index 448252b0d..4226a1ddf 100644
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
index d8e3acbd8..625a9b5bb 100644
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
-- 
2.11.0
