From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  7 Dec 2017 09:20:20 +0100
Subject: [Buildroot] [PATCH 4/5] python-pytablereader: bump to version 0.15.0
In-Reply-To: <20171207082021.4605-1-yegorslists@googlemail.com>
References: <20171207082021.4605-1-yegorslists@googlemail.com>
Message-ID: <20171207082021.4605-4-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pytablereader/Config.in                 | 1 +
 package/python-pytablereader/python-pytablereader.hash | 5 +++--
 package/python-pytablereader/python-pytablereader.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablereader/Config.in b/package/python-pytablereader/Config.in
index fa3dd29f16..29951ab0aa 100644
--- a/package/python-pytablereader/Config.in
+++ b/package/python-pytablereader/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_PYTHON_PYTABLEREADER
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	select BR2_PACKAGE_PYTHON_XLRD # runtime
 	help
diff --git a/package/python-pytablereader/python-pytablereader.hash b/package/python-pytablereader/python-pytablereader.hash
index 5682779271..ade5df3df3 100644
--- a/package/python-pytablereader/python-pytablereader.hash
+++ b/package/python-pytablereader/python-pytablereader.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/pytablereader/json, sha256 locally computed
-md5	60a00cb5ca16aaa16cc4813ef094f803  pytablereader-0.13.3.tar.gz
-sha256	96d5eb060f5ab3bc9072e98c3dbeb22b152ce4ce64f33502e7c2cc394526c60b  pytablereader-0.13.3.tar.gz
+md5	bad666f031a336466c0e9d5c0f4c5783  pytablereader-0.15.0.tar.gz
+sha256	edd7d78ceb1692a1b29254f45574f85f03cd04311d2dfd2256a299c6634cc022  pytablereader-0.15.0.tar.gz
+sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-pytablereader/python-pytablereader.mk b/package/python-pytablereader/python-pytablereader.mk
index a2dd1b9893..ce1de4e4df 100644
--- a/package/python-pytablereader/python-pytablereader.mk
+++ b/package/python-pytablereader/python-pytablereader.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEREADER_VERSION = 0.13.3
+PYTHON_PYTABLEREADER_VERSION = 0.15.0
 PYTHON_PYTABLEREADER_SOURCE = pytablereader-$(PYTHON_PYTABLEREADER_VERSION).tar.gz
-PYTHON_PYTABLEREADER_SITE = https://pypi.python.org/packages/c3/47/550949034950f43d3db3b60b94aa8ee60d548d9f657612d816ad4420f24b
+PYTHON_PYTABLEREADER_SITE = https://pypi.python.org/packages/34/53/e2f51f2efe42c4045ad0822d4ffe739788a74cca35ba7d0bc59a53ec9424
 PYTHON_PYTABLEREADER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEREADER_LICENSE = MIT
 PYTHON_PYTABLEREADER_LICENSE_FILES = LICENSE
-- 
2.11.0
