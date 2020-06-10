From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 11 Jun 2020 01:34:51 +0200
Subject: [Buildroot] [PATCH 2/3] package/python-redis: bump to version 3.5.3
In-Reply-To: <20200610233456.374430-1-grzegorz@blach.pl>
References: <20200610233456.374430-1-grzegorz@blach.pl>
Message-ID: <20200610233456.374430-2-grzegorz@blach.pl>
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
index b7a62ca297..57c71dabfa 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  e3155d2b7a7577ce61e572b4e3535545  redis-3.5.2.tar.gz
-sha256  6d65e84bc58091140081ee9d9c187aab0480097750fac44239307a3bdf0b1251  redis-3.5.2.tar.gz
+md5  7a00d4540374f34e152a33faa1fcee5f  redis-3.5.3.tar.gz
+sha256  0e7e0cfca8660dea8b7d5cd8c4f6c5e29e11f31158c0b0ae91a397f00e5a05a2  redis-3.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256  790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index e09e3d8426..98c1a16599 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 3.5.2
+PYTHON_REDIS_VERSION = 3.5.3
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/08/ca/549a324a6a40611ac6d6192586ca562e79db86dd25fa59c3877ce69ce910
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/b3/17/1e567ff78c83854e16b98694411fe6e08c3426af866ad11397cddceb80d3
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.18.2
