From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 22:48:35 +0100
Subject: [Buildroot] [git commit] python-psutil: bump to version 5.4.8
Message-ID: <20181030214924.DDB4383556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=673808cf7a45afd89eb8ed7cee147c5b01fa5778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 9629d81ed7..1f44281e29 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5	434cd8f9a1fdc93ce7903fdc9b5e3906  psutil-5.4.7.tar.gz
-sha256	5b6322b167a5ba0c5463b4d30dfd379cd4ce245a1162ebf8fc7ab5c5ffae4f3b  psutil-5.4.7.tar.gz
+md5	0f08bf02400f81c28c4581619ca3e6cb  psutil-5.4.8.tar.gz
+sha256	6e265c8f3da00b015d24b842bfeb111f856b13d24f2c57036582568dc650d6c3  psutil-5.4.8.tar.gz
 # Locally computed sha256 checksums
 sha256	bb073826b0dfb43b631c38ad5d9844cda74cc631d2a5569ad8798be4274a3e17  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 61a303f84a..18567702bc 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.4.7
+PYTHON_PSUTIL_VERSION = 5.4.8
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/7d/9a/1e93d41708f8ed2b564395edfa3389f0fd6d567597401c2e5e2775118d8b
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/e3/58/0eae6e4466e5abf779d7e2b71fac7fba5f59e00ea36ddb3ed690419ccb0f
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
