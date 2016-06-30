From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:02:13 +0200
Subject: [Buildroot] [git commit] python-cssselect: bump to version 0.9.2
Message-ID: <20160630220235.1749B820FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be4afac461f813d15ac48683e4b2c5c04c0ed881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cssselect/python-cssselect.hash | 6 +++---
 package/python-cssselect/python-cssselect.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index 08c81e5..d3ee055 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/cssselect/json
-md5	c74f45966277dc7a0f768b9b0f3522ac  cssselect-0.9.1.tar.gz
-# sha256 calculated by scanpypi
-sha256	0535a7e27014874b27ae3a4d33e8749e345bdfa62766195208b7996bf1100682  cssselect-0.9.1.tar.gz
+md5	4c5931d8456dfe72fa4662f9c0509bfa  cssselect-0.9.2.tar.gz
+# sha256 locally computed
+sha256	713b5b99ef08022257b3409c7ae1b18b2c6536b3f155e6237c5cfba0f67ae6f5  cssselect-0.9.2.tar.gz
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index c6b476b..0db69b9 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT_VERSION = 0.9.1
+PYTHON_CSSSELECT_VERSION = 0.9.2
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://pypi.python.org/packages/source/c/cssselect
+PYTHON_CSSSELECT_SITE = https://pypi.python.org/packages/11/21/47b5d2696a945da177d2344b6e330b7b0d1c52404063cb387d2261517ccb
 PYTHON_CSSSELECT_SETUP_TYPE = setuptools
 PYTHON_CSSSELECT_LICENSE = BSD-3c
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
