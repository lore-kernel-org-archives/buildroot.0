From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 17 Jan 2017 11:17:19 +0100
Subject: [Buildroot] [PATCH 2/8] python-dataproperty: bump to version 0.16.2
In-Reply-To: <20170117101725.19629-1-yegorslists@googlemail.com>
References: <20170117101725.19629-1-yegorslists@googlemail.com>
Message-ID: <20170117101725.19629-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-dataproperty/python-dataproperty.hash | 4 ++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 301504285..d84b21458 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/dataproperty/json, sha256 locally computed
-md5	65be4db859ad25bf2c1af25486710f00  DataProperty-0.13.5.tar.gz
-sha256	470e510d9636af446401d9f0bd79172b1f03c5b903819f2ccd4a06ac32ed64d9  DataProperty-0.13.5.tar.gz
+md5	a05cb97210d41677bde224b53562add4  DataProperty-0.16.2.tar.gz
+sha256	c2c6e1f2558bf03b0f8f2dc53a5eb00d9540babd3d69d299be878f2e32937e53  DataProperty-0.16.2.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 13ddf5f64..997019c72 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.13.5
+PYTHON_DATAPROPERTY_VERSION = 0.16.2
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/e0/30/71065e642a985366fc3900316592ff6b88891f96e42107936613cd7a020b
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/c8/95/4803e558a7e29ccf3adbf8f993ec53fe28c46df450892c4cc35c2f0ccedc
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.11.0
