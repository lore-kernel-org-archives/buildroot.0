From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Sep 2016 12:06:20 +0200
Subject: [Buildroot] [git commit] python-netifaces: bump to version 0.10.5
Message-ID: <20160920102825.46BB07FDB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ced87ef097a737018be1e248ecfb069d37eaacfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-netifaces/python-netifaces.hash | 6 +++---
 package/python-netifaces/python-netifaces.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-netifaces/python-netifaces.hash b/package/python-netifaces/python-netifaces.hash
index aebfdf6..6f3e358 100644
--- a/package/python-netifaces/python-netifaces.hash
+++ b/package/python-netifaces/python-netifaces.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=36da76e2cfadd24cc7510c2c0012eb1e, sha256 locally computed
-md5     36da76e2cfadd24cc7510c2c0012eb1e                                  netifaces-0.10.4.tar.gz
-sha256  9656a169cb83da34d732b0eb72b39373d48774aee009a3d1272b7ea2ce109cde  netifaces-0.10.4.tar.gz
+# md5 from https://pypi.python.org/pypi/netifaces/json, sha256 locally computed
+md5     5b4d1f1310ed279e6df27ef3a9b71519                                  netifaces-0.10.5.tar.gz
+sha256  59d8ad52dd3116fcb6635e175751b250dc783fb011adba539558bd764e5d628b  netifaces-0.10.5.tar.gz
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index 2c51ce0..3e01c24 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETIFACES_VERSION = 0.10.4
+PYTHON_NETIFACES_VERSION = 0.10.5
 PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
-PYTHON_NETIFACES_SITE = https://pypi.python.org/packages/source/n/netifaces
+PYTHON_NETIFACES_SITE = https://pypi.python.org/packages/a7/4c/8e0771a59fd6e55aac993a7cc1b6a0db993f299514c464ae6a1ecf83b31d
 PYTHON_NETIFACES_LICENSE = MIT
 PYTHON_NETIFACES_LICENSE_FILES = README.rst
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
