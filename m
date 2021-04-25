From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Apr 2021 11:29:31 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-dataproperty: bump to
 version 0.50.1
In-Reply-To: <20210425092931.2390021-1-fontaine.fabrice@gmail.com>
References: <20210425092931.2390021-1-fontaine.fabrice@gmail.com>
Message-ID: <20210425092931.2390021-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-dataproperty/python-dataproperty.hash | 4 ++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index bd23c461b1..4ea9ddddbc 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dataproperty/json
-md5  14a3e13d611d063df43304c3adeb6d12  DataProperty-0.48.1.tar.gz
-sha256  96bd47c14b4aaba4780d77fa4d2c876cf35eb6848ab1df1a6338447b6c2c10e4  DataProperty-0.48.1.tar.gz
+md5  edd3352ecd0ec124e8227a5c4db61b98  DataProperty-0.50.1.tar.gz
+sha256  cad9080e5d1bac85a3bd33a016743537370d524ae683b012345ed9b5b7715f6b  DataProperty-0.50.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 33e07bc676..b89ff83f1c 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.48.1
+PYTHON_DATAPROPERTY_VERSION = 0.50.1
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/2e/b5/d644919656adf4e7ae94b5479a3fec7497060c89292c335b27e59d66706f
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/8f/8c/e9f2a862ff561ef32d64cc45d296e7c25479941c90d81a238a3233019a05
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.30.2
