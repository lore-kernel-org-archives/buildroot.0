From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 26 Sep 2016 12:07:26 +0200
Subject: [Buildroot] [PATCH] python-u-msgpack: bump to version 2.2
Message-ID: <1474884446-19616-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Package archive includes a proper licence file now, so use it instead of
a source file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-u-msgpack/python-u-msgpack.hash | 7 +++----
 package/python-u-msgpack/python-u-msgpack.mk   | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-u-msgpack/python-u-msgpack.hash b/package/python-u-msgpack/python-u-msgpack.hash
index 16f5040..12f2be3 100644
--- a/package/python-u-msgpack/python-u-msgpack.hash
+++ b/package/python-u-msgpack/python-u-msgpack.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/u-msgpack-python/json
-md5	2ccadbf06c7e70bbdb58e920d045d50c  u-msgpack-python-2.1.tar.gz
-# sha256 calculated by scanpypi
-sha256	66a39ddc6830be29b6d304dee9d4ab37104550ac4565eab1aa4c2bd3d34d759f  u-msgpack-python-2.1.tar.gz
+# md5 from https://pypi.python.org/pypi/u-msgpack-python/json, sha256 locally computed
+md5	f5adfb3e19910d8a41e331d3b03aa7c6  u-msgpack-python-2.2.tar.gz
+sha256	cdd5a88f2313856a6a9f481f652dab9edd5731059badbb0111280f27249930d7  u-msgpack-python-2.2.tar.gz
diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
index e389716..a88beeb 100644
--- a/package/python-u-msgpack/python-u-msgpack.mk
+++ b/package/python-u-msgpack/python-u-msgpack.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_U_MSGPACK_VERSION = 2.1
+PYTHON_U_MSGPACK_VERSION = 2.2
 PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
-PYTHON_U_MSGPACK_SITE = https://pypi.python.org/packages/b7/8d/791f037a0954f98a8eceb09c7c14babb97db0a81c985108bb21939b801eb
+PYTHON_U_MSGPACK_SITE = https://pypi.python.org/packages/66/5b/36fe0fcf290bd39f6ef6c1f5924cf0a9a76b0dc94575975ad7d318619cf9
 PYTHON_U_MSGPACK_SETUP_TYPE = distutils
 PYTHON_U_MSGPACK_LICENSE = MIT
-PYTHON_U_MSGPACK_LICENSE_FILES = umsgpack.py
+PYTHON_U_MSGPACK_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.1.4
