From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 15:42:46 +0200
Subject: [Buildroot] [git commit] package/python-cssutils: bump to version
 1.0.2
Message-ID: <20191012140839.2B2988D690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fead510be43d40b9d8a7e7072ba46e4cbb4e8dc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cssutils/python-cssutils.hash | 8 +++++---
 package/python-cssutils/python-cssutils.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index 7b188bcd43..393daffb8b 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/cssutils/json, sha256 locally computed
-md5	7fcdf2c3e9f053136af1990146eb361d  cssutils-1.0.1.tar.gz
-sha256	d8a18b2848ea1011750231f1dd64fe9053dbec1be0b37563c582561e7a529063  cssutils-1.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/cssutils/json
+md5	dc66d96c2d78f1687f59ac412fe9d318  cssutils-1.0.2.tar.gz
+sha256	a2fcf06467553038e98fea9cfe36af2bf14063eb147a70958cfcaa8f5786acaf  cssutils-1.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256	03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index 3aa96f47d0..513c3a87de 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 1.0.1
+PYTHON_CSSUTILS_VERSION = 1.0.2
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://pypi.python.org/packages/22/de/6b03e0088baf0299ab7d2e95a9e26c2092e9cb3855876b958b6a62175ca2
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/5c/0b/c5f29d29c037e97043770b5e7c740b6252993e4b57f029b3cd03c78ddfec
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
