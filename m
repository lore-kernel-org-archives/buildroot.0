From: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue, 20 Aug 2019 13:03:53 +0000
Subject: [Buildroot] [PATCH 3/3] package/python-redis: bump to version 3.3.8
In-Reply-To: <20190820130353.19236-1-grzegorz@blach.pl>
References: <20190820130353.19236-1-grzegorz@blach.pl>
Message-ID: <20190820130353.19236-3-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 2c47881c7f..7c517ec1af 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5	7ca3cb7a2a71f376fc235590ec7056f8  redis-3.2.1.tar.gz
-sha256	8ca418d2ddca1b1a850afa1680a7d2fd1f3322739271de4b704e0d4668449273  redis-3.2.1.tar.gz
+md5	69748526fd62a35cfacb0d7a6d200e72  redis-3.3.8.tar.gz
+sha256	98a22fb750c9b9bb46e75e945dc3f61d0ab30d06117cbb21ff9cd1d315fedd3b  redis-3.3.8.tar.gz
 # Locally computed sha256 checksums
 sha256	790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index aa1bc3588b..584ef3bc2d 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 3.2.1
+PYTHON_REDIS_VERSION = 3.3.8
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/24/d4/06486dee0f66ef8c5080dc576fdfb33131fd2e0be3747f2be4e5634088a2
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/d7/e9/549305f1c2480f8c24abadfaa71c20967cc3269769073b59960e9a566072
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.23.0
