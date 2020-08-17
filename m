From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:19:42 +0200
Subject: [Buildroot] [git commit branch/next] package/python{3}-psutil: bump
 to version 5.7.2
Message-ID: <20200817130558.A281482168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e27d83dec4861d29d009e4473bfb999c15e4a5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 package/python3-psutil/python3-psutil.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 0000d6033c..1a053cc368 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5  ed7b0f11ed214bcabbe76b7cf52f3ae3  psutil-5.7.0.tar.gz
-sha256  685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e  psutil-5.7.0.tar.gz
+md5  50bf39b4faa268ba1da8a9730bb38bb6  psutil-5.7.2.tar.gz
+sha256  90990af1c3c67195c44c9a889184f84f5b2320dce3ee3acbd054e3ba0b4a7beb  psutil-5.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  24c12984500caa07ffdce19eebc06396c5e6d244b573bc6c438f4a6ef8e56c1b  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 08bb2fd7bd..19d97a6f97 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-psutil/python3-psutil.mk
-PYTHON_PSUTIL_VERSION = 5.7.0
+PYTHON_PSUTIL_VERSION = 5.7.2
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/c4/b8/3512f0e93e0db23a71d82485ba256071ebef99b227351f0f5540f744af41
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
diff --git a/package/python3-psutil/python3-psutil.mk b/package/python3-psutil/python3-psutil.mk
index ddd4b6b7d3..febf0d3edb 100644
--- a/package/python3-psutil/python3-psutil.mk
+++ b/package/python3-psutil/python3-psutil.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-psutil/python-psutil.mk
-PYTHON3_PSUTIL_VERSION = 5.7.0
+PYTHON3_PSUTIL_VERSION = 5.7.2
 PYTHON3_PSUTIL_SOURCE = psutil-$(PYTHON3_PSUTIL_VERSION).tar.gz
-PYTHON3_PSUTIL_SITE = https://files.pythonhosted.org/packages/c4/b8/3512f0e93e0db23a71d82485ba256071ebef99b227351f0f5540f744af41
+PYTHON3_PSUTIL_SITE = https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1
 PYTHON3_PSUTIL_SETUP_TYPE = setuptools
 PYTHON3_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON3_PSUTIL_LICENSE_FILES = LICENSE
