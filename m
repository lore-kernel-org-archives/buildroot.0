From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:08 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-influxdb: bump to version
 5.2.3
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-influxdb/python-influxdb.hash | 4 ++--
 package/python-influxdb/python-influxdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-influxdb/python-influxdb.hash b/package/python-influxdb/python-influxdb.hash
index 28f2825c95..d1f25552c7 100644
--- a/package/python-influxdb/python-influxdb.hash
+++ b/package/python-influxdb/python-influxdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/influxdb/json
-md5	dec1e6fe9770c36290d38fb2a37fba25  influxdb-5.0.0.tar.gz
-sha256	6adba2ddfd5781a06b5204339e679d66645bf6cc2b7f493eb9d7c8986d714e80  influxdb-5.0.0.tar.gz
+md5	01db77f4ca825d554a78804a4be4a353  influxdb-5.2.3.tar.gz
+sha256	30276c7e04bf7659424c733b239ba2f0804d7a1f3c59ec5dd3f88c56176c8d36  influxdb-5.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256	70146f78d168b33ac5903490a918469e22a801a8d3a81103f3d8706dc0024c9a  LICENSE
diff --git a/package/python-influxdb/python-influxdb.mk b/package/python-influxdb/python-influxdb.mk
index 1571cbd47a..160a9d4136 100644
--- a/package/python-influxdb/python-influxdb.mk
+++ b/package/python-influxdb/python-influxdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INFLUXDB_VERSION = 5.0.0
+PYTHON_INFLUXDB_VERSION = 5.2.3
 PYTHON_INFLUXDB_SOURCE = influxdb-$(PYTHON_INFLUXDB_VERSION).tar.gz
-PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/95/26/33e7b85b72a0df2dc00af4c1b9f5df3e7d0aea29ae4f8f65a83f7024c4e2
+PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/d2/0d/351a346886ecbe61211cbfcad8ac73f99f5a9bf526916631c5668dbad601
 PYTHON_INFLUXDB_SETUP_TYPE = setuptools
 PYTHON_INFLUXDB_LICENSE = MIT
 PYTHON_INFLUXDB_LICENSE_FILES = LICENSE
-- 
2.20.1
