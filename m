From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat,  5 Oct 2019 14:23:45 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-httplib2: bump to version
 0.14.0
In-Reply-To: <20191005112347.12280-1-asafka7@gmail.com>
References: <20191005112347.12280-1-asafka7@gmail.com>
Message-ID: <20191005112347.12280-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-httplib2/python-httplib2.hash | 8 +++++---
 package/python-httplib2/python-httplib2.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index 9a075b6d4a..d299b61bc8 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/httplib2/json, sha256 locally computed
-md5 709c305e1b00e9c0af49ee816429569c httplib2-0.10.3.tar.gz
-sha256 e404d3b7bd86c1bc931906098e7c1305d6a3a6dcef141b8bb1059903abb3ceeb httplib2-0.10.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/httplib2/json
+md5	427cda9f4d55762db325bd2eb46b7fe0  httplib2-0.14.0.tar.gz
+sha256	34537dcdd5e0f2386d29e0e2c6d4a1703a3b982d34c198a5102e6e5d6194b107  httplib2-0.14.0.tar.gz
+# Locally computer sha256 checksums
+sha256	d8b8e99f77a260b8ca939f6a73ed0ea86977229a3d97f85547f499a62f61f5af  PKG-INFO
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 7c14e24ef0..a74c0e7c72 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.10.3
+PYTHON_HTTPLIB2_VERSION = 0.14.0
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://pypi.python.org/packages/e4/2e/a7e27d2c36076efeb8c0e519758968b20389adf57a9ce3af139891af2696
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/ce/2e/87461bfbb7e561203b759b3f7f639e2144226604372830d00a8279960ae1
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = PKG-INFO
-- 
2.20.1
