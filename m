From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 09:04:25 +0200
Subject: [Buildroot] [git commit] package/python-docutils: bump to version
 0.15.2
Message-ID: <20190804070336.666588D3A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24a40ffe9aef25dfdcb84a39f49ddef54e851cd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-docutils/python-docutils.hash | 6 +++---
 package/python-docutils/python-docutils.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index dbf0fde8fd..ccccca1064 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/docutils/json, sha256 locally computed
-md5	c53768d63db3873b7d452833553469de  docutils-0.14.tar.gz
-sha256	51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274  docutils-0.14.tar.gz
-sha256  58c2807e9e6e3297ad4da08acc8884d09d8c5ffc9d824dd100922d0bb1ee4717  COPYING.txt
+md5	e26a308d8000b0bed7416a633217c676  docutils-0.15.2.tar.gz
+sha256	a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99  docutils-0.15.2.tar.gz
+sha256  efa0c85aa99ea5b4781240031b0d02af54d7b5554c87ad2b2bea9ba490f6663f  COPYING.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 53da1a56de..9a42d3e5dc 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.14
+PYTHON_DOCUTILS_VERSION = 0.15.2
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://pypi.python.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/93/22/953e071b589b0b1fee420ab06a0d15e5aa0c7470eb9966d60393ce58ad61
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, GPL-3.0 (emacs mode), other
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
 PYTHON_DOCUTILS_SETUP_TYPE = distutils
