From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon,  3 Feb 2020 23:12:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-redis: Bump to version 3.4.1
In-Reply-To: <20200203221223.940456-1-grzegorz@blach.pl>
References: <20200203221223.940456-1-grzegorz@blach.pl>
Message-ID: <20200203221223.940456-2-grzegorz@blach.pl>
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
index c2bca7ea45..02ec3bde5e 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5	7c67aa4554f758261737e5a2dc913cf9  redis-3.3.11.tar.gz
-sha256	8d0fc278d3f5e1249967cba2eb4a5632d19e45ce5c09442b8422d15ee2c22cc2  redis-3.3.11.tar.gz
+md5	c2062a26ea12b69e0d39a23451c89998  redis-3.4.1.tar.gz
+sha256	0dcfb335921b88a850d461dc255ff4708294943322bd55de6cfd68972490ca1f  redis-3.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256	790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 4b7329f7a4..a93ccfe020 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 3.3.11
+PYTHON_REDIS_VERSION = 3.4.1
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/06/ca/00557c74279d2f256d3c42cabf237631355f3a132e4c74c2000e6647ad98
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/ef/2e/2c0f59891db7db087a7eeaa79bc7c7f2c039e71a2b5b0a41391e9d462926
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.25.0
