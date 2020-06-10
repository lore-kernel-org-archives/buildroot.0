From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 22:47:55 +0200
Subject: [Buildroot] [git commit] package/python-xlib: bump to version 0.27
Message-ID: <20200610204702.E471A825D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4713cdea34f40adc39b58f1110e4b109166fbbe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-xlib/python-xlib.hash | 4 ++--
 package/python-xlib/python-xlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xlib/python-xlib.hash b/package/python-xlib/python-xlib.hash
index e51461fc2b..c6a446b6bf 100644
--- a/package/python-xlib/python-xlib.hash
+++ b/package/python-xlib/python-xlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-xlib/json
-md5 ded820dc8e943106bd660801ed7a82f7 python-xlib-0.25.tar.bz2
-sha256 204f280b549352af6cbdaff43405186822ae05749518dd9be209bd88a0088f99 python-xlib-0.25.tar.bz2
+md5 3a87f81bff4cb4f8a52881097ba51a49 python-xlib-0.27.tar.bz2
+sha256 a90667c70905c6ef0754c8a09fa61acbc1e1b7ddb946d527831800d7cbfe9348 python-xlib-0.27.tar.bz2
 # Locally computed sha256 checksums
 sha256 06eb1c441443cf15ac84f309003f4c43c62246939d37c75fc3e056c2d34cd300 LICENSE
diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
index 3ffc4e2ee1..ae8ca1653b 100644
--- a/package/python-xlib/python-xlib.mk
+++ b/package/python-xlib/python-xlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLIB_VERSION = 0.25
+PYTHON_XLIB_VERSION = 0.27
 PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.bz2
-PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/3c/d9/51fc07ae57f6a44e62e2ee04bd501d763ac169ff05c838403ec7ae556992
+PYTHON_XLIB_SITE = https://files.pythonhosted.org/packages/e8/fa/a61ef33df117de4c57d11b4ba0b624f5352f21aa2e1eda404860155e8855
 PYTHON_XLIB_SETUP_TYPE = setuptools
 PYTHON_XLIB_LICENSE = LGPL-2.1+
 PYTHON_XLIB_LICENSE_FILES = LICENSE
