From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:23 +0200
Subject: [Buildroot] [PATCH 03/28] package/python-beautifulsoup4: bump
	version to 4.5.1
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 7 +++----
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index 885c266..c86879f 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/beautifulsoup4/json
-md5	8fbd9a7cac0704645fa20d1419036815  beautifulsoup4-4.4.1.tar.gz
-# sha256 calculated by scanpypi
-sha256	87d4013d0625d4789a4f56b8d79a04d5ce6db1152bb65f1d39744f7709a366b4  beautifulsoup4-4.4.1.tar.gz
+# md5 from https://pypi.python.org/pypi/beautifulsoup4/json, sha256 locally computed
+md5	994abd90e691beaf7d42c00ffb2f3a67  beautifulsoup4-4.5.1.tar.gz
+sha256	3c9474036afda9136aac6463def733f81017bf9ef3510d25634f335b0c87f5e1  beautifulsoup4-4.5.1.tar.gz
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index 58481b9..e2fa9b3 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.4.1
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.5.1
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://pypi.python.org/packages/source/b/beautifulsoup4
+PYTHON_BEAUTIFULSOUP4_SITE = https://pypi.python.org/packages/86/ea/8e9fbce5c8405b9614f1fd304f7109d9169a3516a493ce4f7f77c39435b7
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = setuptools
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = COPYING.txt
-- 
2.9.3
