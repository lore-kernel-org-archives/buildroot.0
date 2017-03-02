From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-pymysql: bump to version 0.7.10
Message-ID: <20170302205924.386F77FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0787792b131e0fc743f3daae958fe50a9046bb47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pymysql/python-pymysql.hash | 4 ++--
 package/python-pymysql/python-pymysql.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index 9e058ab..429ed5a 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pymysql/json, sha256 locally computed
-md5	bf82311ac2df4c43adad003a8c805b90  PyMySQL-0.7.9.tar.gz
-sha256	2331f82b7b85d407c8d9d7a8d7901a6abbeb420533e5d5d64ded5009b5c6dcc3  PyMySQL-0.7.9.tar.gz
+md5 fc96ba7c76c01ff0613b0cca9c40df75 PyMySQL-0.7.10.tar.gz
+sha256 9468bd7d54df68e49c39e91d7c223d13dedf9e4284173cb5d761673e6275024e PyMySQL-0.7.10.tar.gz
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index 94a93a2..863eb8b 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 0.7.9
+PYTHON_PYMYSQL_VERSION = 0.7.10
 PYTHON_PYMYSQL_SOURCE = PyMySQL-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://pypi.python.org/packages/a4/c4/c15457f261fda9839637de044eca9b6da8f55503183fe887523801b85701
+PYTHON_PYMYSQL_SITE = https://pypi.python.org/packages/90/c2/d81638491baa572d6e79b78bde42c7449d2e45b578c919c0df1a76cb859b
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
