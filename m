From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:09 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-redis: bump to version 3.3.11
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-12-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 7c517ec1af..c2bca7ea45 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5	69748526fd62a35cfacb0d7a6d200e72  redis-3.3.8.tar.gz
-sha256	98a22fb750c9b9bb46e75e945dc3f61d0ab30d06117cbb21ff9cd1d315fedd3b  redis-3.3.8.tar.gz
+md5	7c67aa4554f758261737e5a2dc913cf9  redis-3.3.11.tar.gz
+sha256	8d0fc278d3f5e1249967cba2eb4a5632d19e45ce5c09442b8422d15ee2c22cc2  redis-3.3.11.tar.gz
 # Locally computed sha256 checksums
 sha256	790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 584ef3bc2d..4b7329f7a4 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 3.3.8
+PYTHON_REDIS_VERSION = 3.3.11
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/d7/e9/549305f1c2480f8c24abadfaa71c20967cc3269769073b59960e9a566072
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/06/ca/00557c74279d2f256d3c42cabf237631355f3a132e4c74c2000e6647ad98
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.20.1
