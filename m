From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:18:06 +0200
Subject: [Buildroot] [git commit] package/python-oauthlib: bump to version
 3.1.0
Message-ID: <20190903133623.C889E81413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fae5d3298a66c973c37d1e4a5d4801993f3b8e0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-oauthlib/python-oauthlib.hash | 4 ++--
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index 48905a7508..2bf7f7974d 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5	1d8454f0e80a628dcef55db12f73895e  oauthlib-3.0.2.tar.gz
-sha256	b4d99ae8ccfb7d33ba9591b59355c64eef5241534aa3da2e4c0435346b84bc8e  oauthlib-3.0.2.tar.gz
+md5	43cb2b5bac983712ee55076b61181cc2  oauthlib-3.1.0.tar.gz
+sha256	bee41cc35fcca6e988463cacc3bcb8a96224f470ca547e697b604cc697b2f889  oauthlib-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256	3d1e12d8ac52c0b6c148af6d291f72400b8720ed16c0ac4a89868b6d14b1c939  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index d5fdc8ec7d..407abc7659 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 3.0.2
+PYTHON_OAUTHLIB_VERSION = 3.1.0
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/6a/cf/f1a44998f36c62a7a9e51145101428299be27b1e3a411adfd6fd87589889
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/fc/c7/829c73c64d3749da7811c06319458e47f3461944da9d98bb4df1cb1598c2
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
