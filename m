From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 26 Jan 2019 08:33:15 +0200
Subject: [Buildroot] [PATCH 1/1] python-psutil: bump to version 5.5.0
In-Reply-To: <20190126063316.10832-1-asafka7@gmail.com>
References: <20190126063316.10832-1-asafka7@gmail.com>
Message-ID: <20190126063316.10832-4-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 1f44281e29..12d53f95c7 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5	0f08bf02400f81c28c4581619ca3e6cb  psutil-5.4.8.tar.gz
-sha256	6e265c8f3da00b015d24b842bfeb111f856b13d24f2c57036582568dc650d6c3  psutil-5.4.8.tar.gz
+md5	0502dad59fcbe047baebe07165b1376a  psutil-5.5.0.tar.gz
+sha256	1aba93430050270750d046a179c5f3d6e1f5f8b96c20399ba38c596b28fc4d37  psutil-5.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256	bb073826b0dfb43b631c38ad5d9844cda74cc631d2a5569ad8798be4274a3e17  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 18567702bc..2a70845483 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.4.8
+PYTHON_PSUTIL_VERSION = 5.5.0
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/e3/58/0eae6e4466e5abf779d7e2b71fac7fba5f59e00ea36ddb3ed690419ccb0f
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/6e/a0/833bcbcede5141cc5615e50c7cc5b960ce93d9c9b885fbe3b7d36e48a2d4
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.19.1
