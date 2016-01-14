From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 14 Jan 2016 22:19:16 +0100
Subject: [Buildroot] [PATCH] python-can: bump to 1.4.3
Message-ID: <1452806356-8579-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes following legal-info issues:

http://autobuild.buildroot.net/results/316/3162ae78c27e174740012851e4a57fcab58ad421//
http://autobuild.buildroot.net/results/087/087b85d9c3e0184be2261912138c1957fe61fae2//

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-can/python-can.hash | 6 +++---
 package/python-can/python-can.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index bc3dfda..a877862 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b9fb15ff75266f2cb53a175ee2097768, sha256 locally computed
-md5     b9fb15ff75266f2cb53a175ee2097768  python-can-1.4.2.tar.gz
-sha256  29b4e736b0d8b958b8074e209c9f1482e02761bbf97ddf0871f291da312c11ed  python-can-1.4.2.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b9b556fe6f016c0a3b27cc67790cf821, sha256 locally computed
+md5     b9b556fe6f016c0a3b27cc67790cf821  python-can-1.4.3.tar.gz
+sha256  2dcd32737cc39fbf39f41521146a9685f594942c99c6183bad7e3c404930198b  python-can-1.4.3.tar.gz
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index d6370ed..ae9ef1a 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 1.4.2
+PYTHON_CAN_VERSION = 1.4.3
 PYTHON_CAN_SITE = https://pypi.python.org/packages/source/p/python-can
 PYTHON_CAN_LICENSE = LGPLv3
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
-- 
2.1.4
