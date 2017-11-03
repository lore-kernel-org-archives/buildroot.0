From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 22:01:37 +0100
Subject: [Buildroot] [git commit] python-docutils: bump version to 0.14
Message-ID: <20171103205426.2491B81064@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b20351941764b447e7f861130a19a0768730f870
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add licence file checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-docutils/python-docutils.hash | 5 +++--
 package/python-docutils/python-docutils.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index 23941e7..dbf0fde 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/docutils/json, sha256 locally computed
-md5 ea4a893c633c788be9b8078b6b305d53 docutils-0.13.1.tar.gz
-sha256 718c0f5fb677be0f34b781e04241c4067cbd9327b66bdd8e763201130f5175be docutils-0.13.1.tar.gz
+md5	c53768d63db3873b7d452833553469de  docutils-0.14.tar.gz
+sha256	51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274  docutils-0.14.tar.gz
+sha256  58c2807e9e6e3297ad4da08acc8884d09d8c5ffc9d824dd100922d0bb1ee4717  COPYING.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 1ce259b..53da1a5 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.13.1
+PYTHON_DOCUTILS_VERSION = 0.14
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://pypi.python.org/packages/05/25/7b5484aca5d46915493f1fd4ecb63c38c333bd32aa9ad6e19da8d08895ae
+PYTHON_DOCUTILS_SITE = https://pypi.python.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, GPL-3.0 (emacs mode), other
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
 PYTHON_DOCUTILS_SETUP_TYPE = distutils
