From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 19 Oct 2019 21:21:26 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pytablereader: bump to
 version 0.26.1
In-Reply-To: <20191019182127.16345-1-asafka7@gmail.com>
References: <20191019182127.16345-1-asafka7@gmail.com>
Message-ID: <20191019182127.16345-4-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update dependency list.
* License change: same content, line endigs are now CRLF.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pytablereader/Config.in                 | 7 +------
 package/python-pytablereader/python-pytablereader.hash | 9 +++++----
 package/python-pytablereader/python-pytablereader.mk   | 4 ++--
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/package/python-pytablereader/Config.in b/package/python-pytablereader/Config.in
index a93cdbb895..352bc941b6 100644
--- a/package/python-pytablereader/Config.in
+++ b/package/python-pytablereader/Config.in
@@ -4,17 +4,12 @@ config BR2_PACKAGE_PYTHON_PYTABLEREADER
 	select BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4 # runtime
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
-	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
-	select BR2_PACKAGE_PYTHON_MARKDOWN2 # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_PATHPY # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
-	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
-	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	select BR2_PACKAGE_PYTHON_PATHPY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
-	select BR2_PACKAGE_PYTHON_XLRD # runtime
 	help
 	  A python library to load structured table data from
 	  files/URL with various data formats:
diff --git a/package/python-pytablereader/python-pytablereader.hash b/package/python-pytablereader/python-pytablereader.hash
index ade5df3df3..fb873caf71 100644
--- a/package/python-pytablereader/python-pytablereader.hash
+++ b/package/python-pytablereader/python-pytablereader.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pytablereader/json, sha256 locally computed
-md5	bad666f031a336466c0e9d5c0f4c5783  pytablereader-0.15.0.tar.gz
-sha256	edd7d78ceb1692a1b29254f45574f85f03cd04311d2dfd2256a299c6634cc022  pytablereader-0.15.0.tar.gz
-sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
+# md5, sha256 from https://pypi.org/pypi/pytablereader/json
+md5	23ba6121e2f916dfbf4015516779dfcd  pytablereader-0.26.1.tar.gz
+sha256	f2e1477de8886267b765af7861baacc65606761bfabb0689f118cc5d27861f26  pytablereader-0.26.1.tar.gz
+# Locally computed sha256 checksums
+sha256	7fcef461a93fea587224132a865d1285969c9bec15baf59caeb7a8c7638a8744  LICENSE
diff --git a/package/python-pytablereader/python-pytablereader.mk b/package/python-pytablereader/python-pytablereader.mk
index ce1de4e4df..0f9e4c593a 100644
--- a/package/python-pytablereader/python-pytablereader.mk
+++ b/package/python-pytablereader/python-pytablereader.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEREADER_VERSION = 0.15.0
+PYTHON_PYTABLEREADER_VERSION = 0.26.1
 PYTHON_PYTABLEREADER_SOURCE = pytablereader-$(PYTHON_PYTABLEREADER_VERSION).tar.gz
-PYTHON_PYTABLEREADER_SITE = https://pypi.python.org/packages/34/53/e2f51f2efe42c4045ad0822d4ffe739788a74cca35ba7d0bc59a53ec9424
+PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/1e/bc/f60da8a733cd87215d8533f28536f8149eca3b898bbca346b37b6c915d8d
 PYTHON_PYTABLEREADER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEREADER_LICENSE = MIT
 PYTHON_PYTABLEREADER_LICENSE_FILES = LICENSE
-- 
2.20.1
