From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 21:34:08 +0100
Subject: [Buildroot] [git commit] python-can: bump to 1.4.2
Message-ID: <20160113204530.AF647827C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d49d853f5c882c7d9c3c30e61c82265ee26e9e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file and change download location to PyPi.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-can/python-can.hash | 3 +++
 package/python-can/python-can.mk   | 5 ++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
new file mode 100644
index 0000000..bc3dfda
--- /dev/null
+++ b/package/python-can/python-can.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b9fb15ff75266f2cb53a175ee2097768, sha256 locally computed
+md5     b9fb15ff75266f2cb53a175ee2097768  python-can-1.4.2.tar.gz
+sha256  29b4e736b0d8b958b8074e209c9f1482e02761bbf97ddf0871f291da312c11ed  python-can-1.4.2.tar.gz
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index c7b06a5..d6370ed 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = ae5b6cf
-PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can/get
-PYTHON_CAN_SOURCE = $(PYTHON_CAN_VERSION).tar.bz2
+PYTHON_CAN_VERSION = 1.4.2
+PYTHON_CAN_SITE = https://pypi.python.org/packages/source/p/python-can
 PYTHON_CAN_LICENSE = LGPLv3
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
 PYTHON_CAN_SETUP_TYPE = setuptools
