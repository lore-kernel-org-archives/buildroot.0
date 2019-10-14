From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:03:19 +0200
Subject: [Buildroot] [git commit] package/python-pathlib2: bump to version
 2.3.5
Message-ID: <20191014195720.27B928DEEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48ef0d1b2e028237aab3555d367268da1bde2174
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And remove scandir from runtime dependencies.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pathlib2/Config.in            | 1 -
 package/python-pathlib2/python-pathlib2.hash | 4 ++--
 package/python-pathlib2/python-pathlib2.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pathlib2/Config.in b/package/python-pathlib2/Config.in
index 7297f0addb..e28de4c12e 100644
--- a/package/python-pathlib2/Config.in
+++ b/package/python-pathlib2/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_PATHLIB2
 	bool "python-pathlib2"
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_SCANDIR # runtime
 	help
 	  Object-oriented filesystem paths.
 
diff --git a/package/python-pathlib2/python-pathlib2.hash b/package/python-pathlib2/python-pathlib2.hash
index b17517b442..986049d9de 100644
--- a/package/python-pathlib2/python-pathlib2.hash
+++ b/package/python-pathlib2/python-pathlib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathlib2/json
-md5	f9ede5c162ea6fc6a3b1d26db53bb6a2  pathlib2-2.3.3.tar.gz
-sha256	25199318e8cc3c25dcb45cbe084cc061051336d5a9ea2a12448d3d8cb748f742  pathlib2-2.3.3.tar.gz
+md5	f2bd0a363eb0f8fa0556f35c1d9e66fb  pathlib2-2.3.5.tar.gz
+sha256	6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868  pathlib2-2.3.5.tar.gz
 # Locally computed sha256 checksums
 sha256	f8e02f1a07e4c6fc59a4bee831ddde26b97064105c423b9e24340f35aaa80262  LICENSE.rst
diff --git a/package/python-pathlib2/python-pathlib2.mk b/package/python-pathlib2/python-pathlib2.mk
index 256d9b81e1..d813b77d7e 100644
--- a/package/python-pathlib2/python-pathlib2.mk
+++ b/package/python-pathlib2/python-pathlib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHLIB2_VERSION = 2.3.3
+PYTHON_PATHLIB2_VERSION = 2.3.5
 PYTHON_PATHLIB2_SOURCE = pathlib2-$(PYTHON_PATHLIB2_VERSION).tar.gz
-PYTHON_PATHLIB2_SITE = https://files.pythonhosted.org/packages/bf/d7/a2568f4596b75d2c6e2b4094a7e64f620decc7887f69a1f2811931ea15b9
+PYTHON_PATHLIB2_SITE = https://files.pythonhosted.org/packages/94/d8/65c86584e7e97ef824a1845c72bbe95d79f5b306364fa778a3c3e401b309
 PYTHON_PATHLIB2_LICENSE = MIT
 PYTHON_PATHLIB2_LICENSE_FILES = LICENSE.rst
 PYTHON_PATHLIB2_SETUP_TYPE = setuptools
