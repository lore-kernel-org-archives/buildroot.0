From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  2 Nov 2018 11:18:12 +0100
Subject: [Buildroot] [PATCH] python-tornado: bump version to 5.1.1
Message-ID: <20181102101812.18630-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add hash for the license file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-tornado/python-tornado.hash | 8 +++++---
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index c64e537eed..fbf5efa60a 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,3 +1,5 @@
-# md5, sha256 from https://pypi.python.org/pypi/tornado/json
-md5	e5e24ce1c8a4e6442dc38d470172f59e  tornado-5.0.2.tar.gz
-sha256	1b83d5c10550f2653380b4c77331d6f8850f287c4f67d7ce1e1c639d9222fbc7  tornado-5.0.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/tornado/json
+md5	a1ce4f392d30ff0ebcb255150d89b826  tornado-5.1.1.tar.gz
+sha256	4e5158d97583502a7e2739951553cbd88a72076f152b4b11b64b9a10c4c49409  tornado-5.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index ed3a61fcf8..71f536f023 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 5.0.2
+PYTHON_TORNADO_VERSION = 5.1.1
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://pypi.python.org/packages/cf/d1/3be271ae5eba9fb59df63c9891fdc7d8044b999e8ac145994cdbfd2ae66a
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/e6/78/6e7b5af12c12bdf38ca9bfe863fcaf53dc10430a312d0324e76c1e5ca426
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_SETUP_TYPE = setuptools
-- 
2.17.0
