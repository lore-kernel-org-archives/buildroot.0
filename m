From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 12 May 2016 09:55:20 +0200
Subject: [Buildroot] [PATCH] python-setproctitle: bump to version 1.1.10
Message-ID: <1463039720-15651-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Change download location.

Fixes:
http://autobuild.buildroot.net/results/dac/dac6e291dae9f42d71f1e9de6cf0362d613b2d5a

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-setproctitle/python-setproctitle.hash | 6 +++---
 package/python-setproctitle/python-setproctitle.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index 3b0fd71..bf4d960 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=95d9e56c69437246460a20804961d70d, sha256 locally computed.
-md5	95d9e56c69437246460a20804961d70d  setproctitle-1.1.9.tar.gz
-sha256	1c3414d18f9cacdab78b0ffd8e886d56ad45f22e55001a72aaa0b2aeb56a0ad7  setproctitle-1.1.9.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2dcdd1b761700a5a13252fea3dfd1977, sha256 locally computed.
+md5	2dcdd1b761700a5a13252fea3dfd1977  setproctitle-1.1.10.tar.gz
+sha256	6283b7a58477dd8478fbb9e76defb37968ee4ba47b05ec1c053cb39638bd7398  setproctitle-1.1.10.tar.gz
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 63dfad0..36cfec3 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.1.9
+PYTHON_SETPROCTITLE_VERSION = 1.1.10
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = http://pypi.python.org/packages/source/s/setproctitle
+PYTHON_SETPROCTITLE_SITE = https://pypi.python.org/packages/5a/0d/dc0d2234aacba6cf1a729964383e3452c52096dc695581248b548786f2b3
 PYTHON_SETPROCTITLE_LICENSE = BSD-3c
 PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
 PYTHON_SETPROCTITLE_SETUP_TYPE = distutils
-- 
2.8.1
