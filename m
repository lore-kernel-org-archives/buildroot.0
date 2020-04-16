From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Apr 2020 04:49:57 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-dataproperty: bump to
 version 0.48.1
Message-ID: <20200416104957.89939-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit hash change is due to line endings change not in upstream
git repo.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dataproperty/python-dataproperty.hash | 6 +++---
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 2a16250650..bd23c461b1 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dataproperty/json
-md5	8280a85691959d988e58f52c0ed3d311  DataProperty-0.43.1.tar.gz
-sha256	ac2bc221a53fcd2afa140d1feb45cadbe62b335f667dba1e08e3c43a93339103  DataProperty-0.43.1.tar.gz
+md5  14a3e13d611d063df43304c3adeb6d12  DataProperty-0.48.1.tar.gz
+sha256  96bd47c14b4aaba4780d77fa4d2c876cf35eb6848ab1df1a6338447b6c2c10e4  DataProperty-0.48.1.tar.gz
 # Locally computed sha256 checksums
-sha256	98799b7c99b561c5ffa3ac86600e501f761afa8e72af8a2515026445fe134105  LICENSE
+sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 74eeb859a8..33e07bc676 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.43.1
+PYTHON_DATAPROPERTY_VERSION = 0.48.1
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/95/68/fb3498145a106f700ff304158b6d0f0c76eb3001ee5129a4f16c9846b338
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/2e/b5/d644919656adf4e7ae94b5479a3fec7497060c89292c335b27e59d66706f
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.20.1
