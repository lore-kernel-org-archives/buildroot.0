From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Feb 2019 22:39:15 +0100
Subject: [Buildroot] [git commit branch/next] package/python-psutil: bump to
 version 5.5.1
Message-ID: <20190222213801.2F29F88D12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=553bab0a2898fa6497cd73e4d6837dd16bb513dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 12d53f95c7..a6ad618d39 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5	0502dad59fcbe047baebe07165b1376a  psutil-5.5.0.tar.gz
-sha256	1aba93430050270750d046a179c5f3d6e1f5f8b96c20399ba38c596b28fc4d37  psutil-5.5.0.tar.gz
+md5	81d6969ba8392cd3b6f5cba6c4e77caa  psutil-5.5.1.tar.gz
+sha256	72cebfaa422b7978a1d3632b65ff734a34c6b34f4578b68a5c204d633756b810  psutil-5.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256	bb073826b0dfb43b631c38ad5d9844cda74cc631d2a5569ad8798be4274a3e17  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 2a70845483..09d4e95167 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.5.0
+PYTHON_PSUTIL_VERSION = 5.5.1
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/6e/a0/833bcbcede5141cc5615e50c7cc5b960ce93d9c9b885fbe3b7d36e48a2d4
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/c7/01/7c30b247cdc5ba29623faa5c8cf1f1bbf7e041783c340414b0ed7e067c64
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
