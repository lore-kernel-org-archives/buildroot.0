From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 17:00:44 +0200
Subject: [Buildroot] [git commit] package/python-pymysql: bump to version
 0.9.3
Message-ID: <20191005150350.5594480E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08256b1ea73d4e67cf7f79b702b1473add252439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pymysql/python-pymysql.hash | 8 +++++---
 package/python-pymysql/python-pymysql.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index 429ed5aeeb..36323ca73a 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pymysql/json, sha256 locally computed
-md5 fc96ba7c76c01ff0613b0cca9c40df75 PyMySQL-0.7.10.tar.gz
-sha256 9468bd7d54df68e49c39e91d7c223d13dedf9e4284173cb5d761673e6275024e PyMySQL-0.7.10.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pymysql/json
+md5	e5d9183cc0a775ac29f9e0365cca6556  PyMySQL-0.9.3.tar.gz
+sha256	d8c059dcd81dedb85a9f034d5e22dcb4442c0b201908bede99e306d65ea7c8e7  PyMySQL-0.9.3.tar.gz
+# Locally computed sha256 checksums
+sha256	314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index 863eb8be57..edb08ee054 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 0.7.10
+PYTHON_PYMYSQL_VERSION = 0.9.3
 PYTHON_PYMYSQL_SOURCE = PyMySQL-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://pypi.python.org/packages/90/c2/d81638491baa572d6e79b78bde42c7449d2e45b578c919c0df1a76cb859b
+PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/da/15/23ba6592920e21cb40eb0fe0ea002d2b6177beb1ca8a4c1add5a8f32754d
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
