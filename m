From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Nov 2018 09:01:26 +0100
Subject: [Buildroot] [git commit] package/python-pathlib2: bump to version
 2.3.3
Message-ID: <20181202071601.8654881829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a9ad0d366b4e40edb8d5e6a77795fcb4d0badef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pathlib2/python-pathlib2.hash | 4 ++--
 package/python-pathlib2/python-pathlib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathlib2/python-pathlib2.hash b/package/python-pathlib2/python-pathlib2.hash
index 4d2b02f8d4..b17517b442 100644
--- a/package/python-pathlib2/python-pathlib2.hash
+++ b/package/python-pathlib2/python-pathlib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathlib2/json
-md5	fd76fb5d0baa798bfe12fb7965da97f8  pathlib2-2.3.2.tar.gz
-sha256	8eb170f8d0d61825e09a95b38be068299ddeda82f35e96c3301a8a5e7604cb83  pathlib2-2.3.2.tar.gz
+md5	f9ede5c162ea6fc6a3b1d26db53bb6a2  pathlib2-2.3.3.tar.gz
+sha256	25199318e8cc3c25dcb45cbe084cc061051336d5a9ea2a12448d3d8cb748f742  pathlib2-2.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256	f8e02f1a07e4c6fc59a4bee831ddde26b97064105c423b9e24340f35aaa80262  LICENSE.rst
diff --git a/package/python-pathlib2/python-pathlib2.mk b/package/python-pathlib2/python-pathlib2.mk
index dadc97513b..256d9b81e1 100644
--- a/package/python-pathlib2/python-pathlib2.mk
+++ b/package/python-pathlib2/python-pathlib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHLIB2_VERSION = 2.3.2
+PYTHON_PATHLIB2_VERSION = 2.3.3
 PYTHON_PATHLIB2_SOURCE = pathlib2-$(PYTHON_PATHLIB2_VERSION).tar.gz
-PYTHON_PATHLIB2_SITE = https://files.pythonhosted.org/packages/db/a8/7d6439c1aec525ed70810abee5b7d7f3aa35347f59bc28343e8f62019aa2
+PYTHON_PATHLIB2_SITE = https://files.pythonhosted.org/packages/bf/d7/a2568f4596b75d2c6e2b4094a7e64f620decc7887f69a1f2811931ea15b9
 PYTHON_PATHLIB2_LICENSE = MIT
 PYTHON_PATHLIB2_LICENSE_FILES = LICENSE.rst
 PYTHON_PATHLIB2_SETUP_TYPE = setuptools
