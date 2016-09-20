From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Sep 2016 09:41:26 +0200
Subject: [Buildroot] [PATCH 1/2] python-psutil: bump to version 4.3.1
Message-ID: <20160920074127.22328-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 007b7c5..ead2d9c 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/psutil/json, sha256 locally computed
-md5	ca97cf5f09c07b075a12a68b9d44a67d  psutil-4.3.0.tar.gz
-sha256  86197ae5978f216d33bfff4383d5cc0b80f079d09cf45a2a406d1abb5d0299f0  psutil-4.3.0.tar.gz
+md5	199a366dba829c88bddaf5b41d19ddc0  psutil-4.3.1.tar.gz
+sha256  38f74182fb9e15cafd0cdf0821098a95cc17301807aed25634a18b66537ba51b  psutil-4.3.1.tar.gz
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 85882ad..1032318 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 4.3.0
+PYTHON_PSUTIL_VERSION = 4.3.1
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://pypi.python.org/packages/22/a8/6ab3f0b3b74a36104785808ec874d24203c6a511ffd2732dd215cf32d689
+PYTHON_PSUTIL_SITE = https://pypi.python.org/packages/78/cc/f267a1371f229bf16db6a4e604428c3b032b823b83155bd33cef45e49a53
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3c
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.9.3
