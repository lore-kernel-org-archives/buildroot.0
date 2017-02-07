From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 14:25:17 +0100
Subject: [Buildroot] [git commit] python-ubjson: bump to version 0.8.5
Message-ID: <20170207132545.BC92681926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34cb8724ef69c86712b79f425a6f74fbf4af4e7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ubjson/python-ubjson.hash | 6 +++---
 package/python-ubjson/python-ubjson.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ubjson/python-ubjson.hash b/package/python-ubjson/python-ubjson.hash
index 1995da6..88c8c62 100644
--- a/package/python-ubjson/python-ubjson.hash
+++ b/package/python-ubjson/python-ubjson.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=7d7e7b9b67acfb8c6b417dab78ac4639,sha256 locally computed.
-md5	7d7e7b9b67acfb8c6b417dab78ac4639  py-ubjson-0.8.4.tar.gz
-sha256	395c0cbbb097d88bb0db92fe1ac82d31b56f3be396946fe02d38f08e86a8efe9  py-ubjson-0.8.4.tar.gz
+# md5 from https://pypi.python.org/pypi/py-ubjson/json, sha256 locally computed
+md5	09584b02508451a8133095c3b5f2bf41  py-ubjson-0.8.5.tar.gz
+sha256	e58e99753aaff3ed5d884989a6236bd98a4b0dfdb0e62f9753c20f485691fa9e  py-ubjson-0.8.5.tar.gz
diff --git a/package/python-ubjson/python-ubjson.mk b/package/python-ubjson/python-ubjson.mk
index a69efab..e42b2dc 100644
--- a/package/python-ubjson/python-ubjson.mk
+++ b/package/python-ubjson/python-ubjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UBJSON_VERSION = 0.8.4
+PYTHON_UBJSON_VERSION = 0.8.5
 PYTHON_UBJSON_SOURCE = py-ubjson-$(PYTHON_UBJSON_VERSION).tar.gz
-PYTHON_UBJSON_SITE = https://pypi.python.org/packages/bf/a3/990c47fa0d2d244a3d493ae917d5cbf2a0632c1ac6aa53445f4e53ce3675
+PYTHON_UBJSON_SITE = https://pypi.python.org/packages/99/12/173cd417cacdacd158f947365bb17952a93b4e9d08f8a2f4b77d6c17cb4e
 PYTHON_UBJSON_LICENSE = Apache-2.0
 PYTHON_UBJSON_LICENSE_FILES = LICENSE
 PYTHON_UBJSON_SETUP_TYPE = setuptools
