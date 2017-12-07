From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  7 Dec 2017 09:20:18 +0100
Subject: [Buildroot] [PATCH 2/5] python-dataproperty: bump to version 0.29.1
In-Reply-To: <20171207082021.4605-1-yegorslists@googlemail.com>
References: <20171207082021.4605-1-yegorslists@googlemail.com>
Message-ID: <20171207082021.4605-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-dataproperty/Config.in                | 6 ++----
 package/python-dataproperty/python-dataproperty.hash | 5 +++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-dataproperty/Config.in b/package/python-dataproperty/Config.in
index 7ef7f085be..1868709047 100644
--- a/package/python-dataproperty/Config.in
+++ b/package/python-dataproperty/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_PYTHON_DATAPROPERTY
 	bool "python-dataproperty"
-	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
+	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
 	  Python library for extract property from data.
 
diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index be7eecb285..0e74acac5a 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/DataProperty/json, sha256 locally computed
-md5	6e757aa2537721681b437cfeacd7c599  DataProperty-0.25.6.tar.gz
-sha256	07c36a290311102fd10552a7855baf5c94e9f60506afa37e0dfb88db5b3f5406  DataProperty-0.25.6.tar.gz
+md5	66ecca45ae5e00b2a88799a2795a0cf8  DataProperty-0.29.1.tar.gz
+sha256	3e547003b1af16126ff48b1c284241bc8a46d1e38e334ecd3a5ba87955446806  DataProperty-0.29.1.tar.gz
+sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 96a7739df1..900cd04608 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.25.6
+PYTHON_DATAPROPERTY_VERSION = 0.29.1
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/bb/4b/d9a8d24aa27bd2827d70e68f1f389cdd824e5bea7541993fac8cb35100ed
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/38/6f/bf65cf1398ca34c709bf14ca9bc33821588498abe50c4652b0d345b9c08c
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.11.0
