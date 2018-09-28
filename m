From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Sep 2018 13:20:03 +0200
Subject: [Buildroot] [git commit] python-psutil: bump to version 5.4.7
Message-ID: <20180928111932.5129E8A29E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1cf5da192d69084532946e523f38b595e09250f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psutil/python-psutil.hash | 8 +++++---
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 19fb8a4fdb..9629d81ed7 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/psutil/json, sha256 locally computed
-md5	c9aa2599dcd9e5b59d71b6660d396062  psutil-5.2.0.tar.gz
-sha256  2fc91d068faa5613c093335f0e758673ef8c722ad4bfa4aded64c13ae69089eb  psutil-5.2.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/psutil/json
+md5	434cd8f9a1fdc93ce7903fdc9b5e3906  psutil-5.4.7.tar.gz
+sha256	5b6322b167a5ba0c5463b4d30dfd379cd4ce245a1162ebf8fc7ab5c5ffae4f3b  psutil-5.4.7.tar.gz
+# Locally computed sha256 checksums
+sha256	bb073826b0dfb43b631c38ad5d9844cda74cc631d2a5569ad8798be4274a3e17  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 2b41df743a..61a303f84a 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.2.0
+PYTHON_PSUTIL_VERSION = 5.4.7
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://pypi.python.org/packages/3c/2f/f3ab91349c666f009077157b12057e613a3152a46a6c3be883777546b6de
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/7d/9a/1e93d41708f8ed2b564395edfa3389f0fd6d567597401c2e5e2775118d8b
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
