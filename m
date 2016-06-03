From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:51:52 +0200
Subject: [Buildroot] [git commit] python-werkzeug: bump to version 0.11.10
Message-ID: <20160603075313.438E081F33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cf0742ac111010501e15a98768c3d4c36068eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change download location.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-werkzeug/python-werkzeug.hash | 6 +++---
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index f833b89..e2afd14 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9479bc7ea6a42c2d0d82929d3926df67, sha256 locally computed
-md5	9479bc7ea6a42c2d0d82929d3926df67  Werkzeug-0.11.3.tar.gz
-sha256	eb5f700a9bfc96420b055635af9002d3662e43d80c3ffd31f224c25bc0d5f462  Werkzeug-0.11.3.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=780967186f9157e88f2bfbfa6f07a893, sha256 locally computed
+md5	780967186f9157e88f2bfbfa6f07a893  Werkzeug-0.11.10.tar.gz
+sha256	cc64dafbacc716cdd42503cf6c44cb5a35576443d82f29f6829e5c49264aeeee  Werkzeug-0.11.10.tar.gz
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 3df481a..c0af65c 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 0.11.3
+PYTHON_WERKZEUG_VERSION = 0.11.10
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = http://pypi.python.org/packages/source/W/Werkzeug
+PYTHON_WERKZEUG_SITE = https://pypi.python.org/packages/b7/7f/44d3cfe5a12ba002b253f6985a4477edfa66da53787a2a838a40f6415263
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3c
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE
