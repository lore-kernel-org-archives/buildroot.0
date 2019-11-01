From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  1 Nov 2019 19:04:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-channels-redis: bump to
 version 2.4.1
In-Reply-To: <20191101170417.29286-1-asafka7@gmail.com>
References: <20191101170417.29286-1-asafka7@gmail.com>
Message-ID: <20191101170417.29286-5-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-channels-redis/python-channels-redis.hash | 6 +++---
 package/python-channels-redis/python-channels-redis.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-channels-redis/python-channels-redis.hash b/package/python-channels-redis/python-channels-redis.hash
index 155091933b..1d80b4c124 100644
--- a/package/python-channels-redis/python-channels-redis.hash
+++ b/package/python-channels-redis/python-channels-redis.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/channels_redis/json
-md5	d060c96cc53c6b2c3f93df4d7aefecf3  channels_redis-2.4.0.tar.gz
-sha256	b7ccbcb2fd4e568c08c147891b26db59aa25d88b65af826ce7f70c815cfb91bc  channels_redis-2.4.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/channels-redis/json
+md5	9ec9ffd467e181906f257d6c0dbabf45  channels_redis-2.4.1.tar.gz
+sha256	ddfa0c067085fdce24fb80d9c0b848638cbdbf0e1167f14eb2e99d635ad216e6  channels_redis-2.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
index 4765c1013a..c2c6f59c3c 100644
--- a/package/python-channels-redis/python-channels-redis.mk
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_REDIS_VERSION = 2.4.0
+PYTHON_CHANNELS_REDIS_VERSION = 2.4.1
 PYTHON_CHANNELS_REDIS_SOURCE = channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
-PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/79/20/896a5246ef703a74dd0af6e46038eb7838d801e532cf25474d2580f09d3e
+PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/87/a9/8d11c32ae6bf3a2cc893185f7d1e03b80bda680131a08473c07ed1fe591d
 PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
-- 
2.20.1
