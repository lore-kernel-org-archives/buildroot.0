From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:52 +0200
Subject: [Buildroot] [git commit] package/python-pymysql: bump version to
	0.7.9
Message-ID: <20161005210758.D5CF98222E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=925e3284cff4fb4ab71efebdd8a0ef6649ed9a3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pymysql/python-pymysql.hash | 7 +++----
 package/python-pymysql/python-pymysql.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index fc7e5e3..9e058ab 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,4 +1,3 @@
-#md5 from https://pypi.python.org/pypi?:action=show_md5&digest=6d757cda8bfbd312714207f7c0bef5c7
-md5     6d757cda8bfbd312714207f7c0bef5c7 PyMySQL-0.7.2.tar.gz
-# Locally calculated:
-sha256 bd7acb4990dbf097fae3417641f93e25c690e01ed25c3ed32ea638d6c3ac04ba  PyMySQL-0.7.2.tar.gz
+# md5 from https://pypi.python.org/pypi/pymysql/json, sha256 locally computed
+md5	bf82311ac2df4c43adad003a8c805b90  PyMySQL-0.7.9.tar.gz
+sha256	2331f82b7b85d407c8d9d7a8d7901a6abbeb420533e5d5d64ded5009b5c6dcc3  PyMySQL-0.7.9.tar.gz
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index e58ff7e..94a93a2 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 0.7.2
+PYTHON_PYMYSQL_VERSION = 0.7.9
 PYTHON_PYMYSQL_SOURCE = PyMySQL-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://pypi.python.org/packages/source/P/PyMySQL
+PYTHON_PYMYSQL_SITE = https://pypi.python.org/packages/a4/c4/c15457f261fda9839637de044eca9b6da8f55503183fe887523801b85701
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
