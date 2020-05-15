From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 22:37:52 +0200
Subject: [Buildroot] [git commit branch/next] package/python-redis: Bump to
 version 3.5.1
Message-ID: <20200515202143.9B08191984@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41d80c72c67e1016875b16e98f38a1bc3f5b25e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index b30942311b..3f0c2d4d2c 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  5b432eff77163a353c520737d057e494  redis-3.5.0.tar.gz
-sha256  7378105cd8ea20c4edc49f028581e830c01ad5f00be851def0f4bc616a83cd89  redis-3.5.0.tar.gz
+md5  a005acb0f05c7929c8b5961d216a0220  redis-3.5.1.tar.gz
+sha256  6e9d2722a95d10ddf854596e66516d316d99c6a483e5db3b35c34e1158b2bfa1  redis-3.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  790148d8c12f8a38b2707a74be2343316bad126995ff54801a181b8b231ba124  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 273f55748b..ffd18a00b8 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 3.5.0
+PYTHON_REDIS_VERSION = 3.5.1
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/05/5e/5e9a329ba600244f2d37f86131ccec19936d41cba0887240086b44cf4f54
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/1c/74/4d3250366bd783f9907d8ed32140bf4beef11000200d7edf8245800e6c4c
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
