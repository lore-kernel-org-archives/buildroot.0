From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 20 Jun 2016 09:54:12 +0200
Subject: [Buildroot] [PATCH] python-pathvalidate: bump to version 0.4.2
Message-ID: <1466409252-4122-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

This version makes pytest-runner dependency optional.

Fixes:
http://autobuild.buildroot.net/results/0b6/0b6984c84cb10856a0cf8b063d61782da8895ca8
http://autobuild.buildroot.net/results/892/8927f8ce3aaea5f88da09c4541241901e7867584
http://autobuild.buildroot.net/results/6b2/6b218ed9c12ed5f90a1488f9649dd796177cad0d
http://autobuild.buildroot.net/results/5ef/5efb8d392c13901a46288590e73070d45e4e13bf
http://autobuild.buildroot.net/results/e51/e5195b96a7be915034c755469ec273c1f7d9e4d1
http://autobuild.buildroot.net/results/f81/f81a39dd2bae6b30766109f020cb4e3f1b1996ea
http://autobuild.buildroot.net/results/712/71248379935dbd17c94f5e1cdc8f043f366992a7

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pathvalidate/python-pathvalidate.hash | 6 +++---
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index e1395ac..90208f4 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/pathvalidate/json
-md5	e53ca2293a6602e003e11bcf88baecad  pathvalidate-0.4.1.tar.gz
-# sha256 calculated by scanpypi
-sha256	0d7b60327ee49a7d5cc3f7d7f8e3b6b6fe6cd3e2bde5e13e2c6ecabcc5022fa4  pathvalidate-0.4.1.tar.gz
+md5	d3d89abc6c053b4182be29c23beccf26  pathvalidate-0.4.2.tar.gz
+# sha256 calculated locally
+sha256	4316cf5f862b70efd7792b98f46871592b80924840da69a28df1921d7702fcf9  pathvalidate-0.4.2.tar.gz
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index de47455..0c7cc76 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 0.4.1
+PYTHON_PATHVALIDATE_VERSION = 0.4.2
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/e4/68/831a61ad8c7f7b8340fe651aa189591a7ebbcda1456782d4c37d40f229c1
+PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/fd/b9/726269557d5846f253f7ecec483d801582a27b77852a76e2dc9c61dba2b6
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
-- 
2.8.1
