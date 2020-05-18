From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon, 18 May 2020 16:26:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-redis: bump to version 3.5.2
In-Reply-To: <20200518142609.740711-1-grzegorz@blach.pl>
References: <20200518142609.740711-1-grzegorz@blach.pl>
Message-ID: <20200518142609.740711-2-grzegorz@blach.pl>
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
index 3f0c2d4d2c..b7a62ca297 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  a005acb0f05c7929c8b5961d216a0220  redis-3.5.1.tar.gz
-sha256  6e9d2722a95d10ddf854596e66516d316d99c6a483e5db3b35c34e1158b2bfa1  redis-3.5.1.tar.gz
+md5  e3155d2b7a7577ce61e572b4e3535545  redis-3.5.2.tar.gz
+sha256  6d65e84bc58091140081ee9d9c187aab0480097750fac44239307a3bdf0b1251  redis-3.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index ffd18a00b8..e09e3d8426 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 3.5.1
+PYTHON_REDIS_VERSION = 3.5.2
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/1c/74/4d3250366bd783f9907d8ed32140bf4beef11000200d7edf8245800e6c4c
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/08/ca/549a324a6a40611ac6d6192586ca562e79db86dd25fa59c3877ce69ce910
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.26.2
