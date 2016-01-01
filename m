From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri,  1 Jan 2016 23:18:29 +0100
Subject: [Buildroot] [PATCH] python-can: bump to 1.4.1
Message-ID: <1451686709-25501-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash file and change download location to PyPi.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-can/python-can.hash | 3 +++
 package/python-can/python-can.mk   | 5 ++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 create mode 100644 package/python-can/python-can.hash

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
new file mode 100644
index 0000000..fc9fc2a
--- /dev/null
+++ b/package/python-can/python-can.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=63e922ae913bb0db1dd54e9189810130, sha256 locally computed
+md5     63e922ae913bb0db1dd54e9189810130  python-can-1.4.1.tar.gz
+sha256  ab60195d112504fc4d38b74fb4a6874cd509066472b9d6d3516a8ce1485cec6f  python-can-1.4.1.tar.gz
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index c7b06a5..9a9d9df 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = ae5b6cf
-PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can/get
-PYTHON_CAN_SOURCE = $(PYTHON_CAN_VERSION).tar.bz2
+PYTHON_CAN_VERSION = 1.4.1
+PYTHON_CAN_SITE = https://pypi.python.org/packages/source/p/python-can
 PYTHON_CAN_LICENSE = LGPLv3
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
 PYTHON_CAN_SETUP_TYPE = setuptools
-- 
2.1.4
