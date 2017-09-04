From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  4 Sep 2017 08:21:25 +0200
Subject: [Buildroot] [PATCH 4/5] python-dataproperty: bump to version 0.25.6
In-Reply-To: <20170904062126.3274-1-yegorslists@googlemail.com>
References: <20170904062126.3274-1-yegorslists@googlemail.com>
Message-ID: <20170904062126.3274-4-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-dataproperty/python-dataproperty.hash | 6 +++---
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index e9de5a492..be7eecb28 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/dataproperty/json, sha256 locally computed
-md5 cdc032e071164aaf31ab3e2b76cd4a1b  DataProperty-0.23.0.tar.gz
-sha256 be42eba1febaab6e37f5e07d558d87bb79e46092dce7deb2934d788d48e80e82  DataProperty-0.23.0.tar.gz
+# md5 from https://pypi.python.org/pypi/DataProperty/json, sha256 locally computed
+md5	6e757aa2537721681b437cfeacd7c599  DataProperty-0.25.6.tar.gz
+sha256	07c36a290311102fd10552a7855baf5c94e9f60506afa37e0dfb88db5b3f5406  DataProperty-0.25.6.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 65a8fca09..96a7739df 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.23.0
+PYTHON_DATAPROPERTY_VERSION = 0.25.6
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/6d/40/0e66a33d4f909bc3fff1cb760d1827281207ace7de8dc3f202b5be7d3e65
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/bb/4b/d9a8d24aa27bd2827d70e68f1f389cdd824e5bea7541993fac8cb35100ed
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.11.0
