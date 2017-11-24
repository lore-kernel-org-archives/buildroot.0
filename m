From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 21:36:19 +0100
Subject: [Buildroot] [git commit branch/next] python-cheroot: bump version
 to 5.10.0
Message-ID: <20171124202858.94867815CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43f76947ac2a05f24c3129db1bb690aad65e9474
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix licence file name and add checksum.

Fixes:
http://autobuild.buildroot.net/results/94d/94dee5b01e0f7693d4e6e05074e7d93e92236e2c

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-cheroot/python-cheroot.hash | 5 +++--
 package/python-cheroot/python-cheroot.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index 7b309a9..664ad10 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/Cheroot/json, sha256 locally computed
-md5	288eb3a6df4964ba0435493d2914da3d  cheroot-5.9.0.tar.gz
-sha256	d8ec06b6e907b911ac5bb626876ee498c289d21f1a638cb2510fc57290567ef5  cheroot-5.9.0.tar.gz
+md5	d256a0ccd28c3426a7764868e98a9020  cheroot-5.10.0.tar.gz
+sha256	a408f1b80a3f93a3b49fc330f68eea40d8d30b9b07084f374607d1a5cc2e824f  cheroot-5.10.0.tar.gz
+sha256  02f4efe6e7dcd218c33cfa065c0552de983b5ad563b053e97697c5abd2ef14f9  LICENSE
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index d3e056b..07775e5 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 5.9.0
+PYTHON_CHEROOT_VERSION = 5.10.0
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://pypi.python.org/packages/df/63/5c5265feb7e02e43d2f3a3c19dbb2d78742b0a2ff237c9e473c77bc23500
+PYTHON_CHEROOT_SITE = https://pypi.python.org/packages/14/dc/afc41e7f7e797973808d8520e6aef21c4efd00550aa32f5b726327d36be0
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
-PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
+PYTHON_CHEROOT_LICENSE_FILES = LICENSE
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
 PYTHON_CHEROOT_DEPENDENCIES = host-python-setuptools-scm
 
