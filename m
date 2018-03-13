From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 14:49:41 +0100
Subject: [Buildroot] [PATCH] docker-compose: bump version to 1.20-rc2
Message-ID: <20180313134941.4999-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a race condition in ParallelStreamWriter.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-compose/docker-compose.hash | 4 ++--
 package/docker-compose/docker-compose.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index df4d915469..abcb424d09 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/docker-compose/json, sha256 locally computed
-md5	bd703d931f159b08ed5fe4fadcb12652  docker-compose-1.20.0rc1.tar.gz
-sha256	ad14f8dda3eb5c999f6195bf88420dafd1aada80535dab3afd3350fe8438e0a3  docker-compose-1.20.0rc1.tar.gz
+md5	0c62ffccfbf22195dc8f168d7ce104b0  docker-compose-1.20.0rc2.tar.gz
+sha256	8f4c7d1d8bef2f137f28332f13187af159ea55ceb58338dfc70cda3800f65d11  docker-compose-1.20.0rc2.tar.gz
 sha256	552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 155c529391..d5f71c05a0 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 1.20.0rc1
-DOCKER_COMPOSE_SITE = https://pypi.python.org/packages/ca/d9/21266285a3c34e8e023f2504c13ffb48e6acd1e43ccdd0c55188d7039505
+DOCKER_COMPOSE_VERSION = 1.20.0rc2
+DOCKER_COMPOSE_SITE = https://pypi.python.org/packages/b9/fe/44a2d249d86ef04ccf792c841fc73ffcf96e6138ca3a926de8ba032cf912
 DOCKER_COMPOSE_SETUP_TYPE = setuptools
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.11.0
