From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 May 2020 21:52:25 +0200
Subject: [Buildroot] [git commit] package/python-redis: Bump to version 3.5.0
Message-ID: <20200505193706.0CB3090E83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2ee4f09dff143d45199f10cddac199dbe17fead
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-redis/python-redis.hash | 6 +++---
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 02ec3bde5e..b30942311b 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5	c2062a26ea12b69e0d39a23451c89998  redis-3.4.1.tar.gz
-sha256	0dcfb335921b88a850d461dc255ff4708294943322bd55de6cfd68972490ca1f  redis-3.4.1.tar.gz
+md5  5b432eff77163a353c520737d057e494  redis-3.5.0.tar.gz
+sha256  7378105cd8ea20c4edc49f028581e830c01ad5f00be851def0f4bc616a83cd89  redis-3.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256	790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
+sha256  790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index a93ccfe020..273f55748b 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 3.4.1
+PYTHON_REDIS_VERSION = 3.5.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/ef/2e/2c0f59891db7db087a7eeaa79bc7c7f2c039e71a2b5b0a41391e9d462926
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/05/5e/5e9a329ba600244f2d37f86131ccec19936d41cba0887240086b44cf4f54
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
