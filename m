From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:28 +0200
Subject: [Buildroot] [PATCH 08/28] package/python-dataproperty: bump version
	to 0.9.0
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-dataproperty/python-dataproperty.hash | 7 +++----
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 916352e..dc075b9 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/dataproperty/json
-md5	7ad4dabb5469bb3f150dd1018680119c  DataProperty-0.7.1.tar.gz
-# sha256 calculated by scanpypi
-sha256	2d53019e6ca7b95511ec733ea57dc108d916d2dd0818d88d1b7c0e06854a2d2e  DataProperty-0.7.1.tar.gz
+# md5 from https://pypi.python.org/pypi/dataproperty/json, sha256 locally computed
+md5	9d910f0994b892df260977146f9a2bd1  DataProperty-0.9.0.tar.gz
+sha256	02ab30a4873eeb1c538cc54552c9f9ef226b3243b7546e8317c583550960319d  DataProperty-0.9.0.tar.gz
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 927fa69..727b8c7 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.7.1
+PYTHON_DATAPROPERTY_VERSION = 0.9.0
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/1f/64/b17e5ab3935484869cc3e8ec06ede0c94a296b4955c947d1dfe4460955f9
+PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/d4/7a/8a214fc3c6eb2aeb42282a25355296f391cdcfd6c6b51c80bd644ce6b229
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.9.3
