From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:17 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pudb: bump to version 2019.1
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-11-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pudb/python-pudb.hash | 8 +++++---
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index febf38f82e..b3c089b85f 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pudb/json, sha256 locally computed
-md5 97597d9fec79494a83ec8d55987a8a82 pudb-2017.1.2.tar.gz
-sha256 29d82ed05030146e5f2f9431926cc24f6c6c284cb451a4a850625fc0303e46e7 pudb-2017.1.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pudb/json
+md5	4c024311d3f53bc189084821e7ef7d5e  pudb-2019.1.tar.gz
+sha256	ac30cfc64580958ab7265decb4cabb9141f08781ff072e9a336d5a7942ce35a6  pudb-2019.1.tar.gz
+# Locally computed sha256 checksums
+sha256	a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index b6b3d53867..6a462bf3e5 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2017.1.2
+PYTHON_PUDB_VERSION = 2019.1
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://pypi.python.org/packages/d3/8a/e0fa18cf6f939a63364117546c9bd933add800642004ad40fd5f5bdba0c6
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/32/2a/96f72649e5dfc90cf69d8590c00884c6897d6cbc54f727fb40f47b4faae3
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
-- 
2.20.1
