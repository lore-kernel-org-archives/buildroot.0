From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2020 20:32:28 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-sockjs: bump to version
 0.11.0
Message-ID: <20201123033228.2106695-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sockjs/python-sockjs.hash | 6 +++---
 package/python-sockjs/python-sockjs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sockjs/python-sockjs.hash b/package/python-sockjs/python-sockjs.hash
index 55ea9dc644..137b54a89d 100644
--- a/package/python-sockjs/python-sockjs.hash
+++ b/package/python-sockjs/python-sockjs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sockjs/json
-md5	369417bd103f841f236a8623ea29353c  sockjs-0.10.0.tar.gz
-sha256	005a820387bb4611b59341eac091b05d4204050dd42e4ea6cfb83607e23e2f06  sockjs-0.10.0.tar.gz
+md5  e28c1a82aa84c3994817905090abb169  sockjs-0.11.0.tar.gz
+sha256  0347d404ed9ef3196506787ed8018f87ee4e2d0baea49d420cdd53a969bec229  sockjs-0.11.0.tar.gz
 # Locally computed sha256 checksums
-sha256	7be23c071df0314fadeba6077a3830340a5121ad88bfa66b0c095051a766e141  LICENSE.txt
+sha256  7be23c071df0314fadeba6077a3830340a5121ad88bfa66b0c095051a766e141  LICENSE.txt
diff --git a/package/python-sockjs/python-sockjs.mk b/package/python-sockjs/python-sockjs.mk
index e0f58e2b61..0aea63f934 100644
--- a/package/python-sockjs/python-sockjs.mk
+++ b/package/python-sockjs/python-sockjs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKJS_VERSION = 0.10.0
+PYTHON_SOCKJS_VERSION = 0.11.0
 PYTHON_SOCKJS_SOURCE = sockjs-$(PYTHON_SOCKJS_VERSION).tar.gz
-PYTHON_SOCKJS_SITE = https://files.pythonhosted.org/packages/35/0e/6aa4f3283b064b04a0c7f3859c8c2c0b736c05cfb07853b6d94073c1bf63
+PYTHON_SOCKJS_SITE = https://files.pythonhosted.org/packages/88/e9/af7b321f70325fd2af3941aa147efd097156150da635e09efc7ccf70e54d
 PYTHON_SOCKJS_SETUP_TYPE = setuptools
 PYTHON_SOCKJS_LICENSE = Apache-2.0
 PYTHON_SOCKJS_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
