From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:38 +0200
Subject: [Buildroot] [git commit] package/python-html5lib: bump version to
	1.0b10
Message-ID: <20161005210758.3FC057FCD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f0416cd3f90553e1094af6c1475a74087225a82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-html5lib/python-html5lib.hash | 6 +++---
 package/python-html5lib/python-html5lib.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-html5lib/python-html5lib.hash b/package/python-html5lib/python-html5lib.hash
index 0ec712a..7ea082f 100644
--- a/package/python-html5lib/python-html5lib.hash
+++ b/package/python-html5lib/python-html5lib.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=ef43cb05e9e799f25d65d1135838a96f, sha256 locally computed
-md5     ef43cb05e9e799f25d65d1135838a96f  html5lib-0.9999999.tar.gz
-sha256  2612a191a8d5842bfa057e41ba50bbb9dcb722419d2408c78cff4758d0754868  html5lib-0.9999999.tar.gz
+# md5 from https://pypi.python.org/pypi/html5lib/json, sha256 locally computed
+md5	5ada1243b7a863624b2f35245b2186e9  html5lib-1.0b10.tar.gz
+sha256	0d5fd54d5b2b79b876007a70c033a4023577768d18022c15681c00561432a0f9  html5lib-1.0b10.tar.gz
diff --git a/package/python-html5lib/python-html5lib.mk b/package/python-html5lib/python-html5lib.mk
index 93eef9a..38affcb 100644
--- a/package/python-html5lib/python-html5lib.mk
+++ b/package/python-html5lib/python-html5lib.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_HTML5LIB_VERSION = 0.9999999
+PYTHON_HTML5LIB_VERSION = 1.0b10
 PYTHON_HTML5LIB_SOURCE = html5lib-$(PYTHON_HTML5LIB_VERSION).tar.gz
-PYTHON_HTML5LIB_SITE = https://pypi.python.org/packages/source/h/html5lib
+PYTHON_HTML5LIB_SITE = https://pypi.python.org/packages/97/16/982214624095c1420c75f3bd295d9e658794aafb95fc075823de107e0ae4
 PYTHON_HTML5LIB_LICENSE = MIT
 PYTHON_HTML5LIB_LICENSE_FILES = LICENSE
-PYTHON_HTML5LIB_SETUP_TYPE = distutils
+PYTHON_HTML5LIB_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
