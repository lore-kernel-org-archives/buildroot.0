From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:44:56 +0100
Subject: [Buildroot] [git commit] package/python-psutil: bump to version
 5.6.1
Message-ID: <20190315204247.C64428EC9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0565da17ef6266d2ba8ae096a5a584c2720935a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index a6ad618d39..dea94d43fc 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5	81d6969ba8392cd3b6f5cba6c4e77caa  psutil-5.5.1.tar.gz
-sha256	72cebfaa422b7978a1d3632b65ff734a34c6b34f4578b68a5c204d633756b810  psutil-5.5.1.tar.gz
+md5	765a4179f02c149794a6e99d890dfa4b  psutil-5.6.1.tar.gz
+sha256	fa0a570e0a30b9dd618bffbece590ae15726b47f9f1eaf7518dfb35f4d7dcd21  psutil-5.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256	bb073826b0dfb43b631c38ad5d9844cda74cc631d2a5569ad8798be4274a3e17  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 09d4e95167..3a6e7961bc 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.5.1
+PYTHON_PSUTIL_VERSION = 5.6.1
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/c7/01/7c30b247cdc5ba29623faa5c8cf1f1bbf7e041783c340414b0ed7e067c64
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/2f/b8/11ec5006d2ec2998cb68349b8d1317c24c284cf918ecd6729739388e4c56
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
