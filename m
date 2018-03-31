From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 08:12:57 +0200
Subject: [Buildroot] [git commit] python-docker: bump version to 3.1.4
Message-ID: <20180331061542.370B683E7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8151145f29e80e686d87675e7da7cae696196c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-docker/python-docker.hash | 4 ++--
 package/python-docker/python-docker.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
index c09ccc3859..e811d3a8ac 100644
--- a/package/python-docker/python-docker.hash
+++ b/package/python-docker/python-docker.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/docker/json, sha256 locally computed
-md5	71e97726a8bdc56effa7df8321c47af1  docker-3.1.1.tar.gz
-sha256	462165ca6367f802280684ab44e581cd2efba8995d78d07ea994e42194927c3b  docker-3.1.1.tar.gz
+md5	981b23b41fd2346efcae977244b7188e  docker-3.1.4.tar.gz
+sha256	753251b142d56f243fba53ba321a37740a6b6583c528437f45df4d28ba3d4d5d  docker-3.1.4.tar.gz
 sha256	f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
index fb9b32a603..6a818ebaed 100644
--- a/package/python-docker/python-docker.mk
+++ b/package/python-docker/python-docker.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCKER_VERSION = 3.1.1
+PYTHON_DOCKER_VERSION = 3.1.4
 PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
-PYTHON_DOCKER_SITE = https://pypi.python.org/packages/0d/17/ad98e025e5528337c4dc5835a5874898eb226da17e4ffed732c894cb1938
+PYTHON_DOCKER_SITE = https://pypi.python.org/packages/7f/22/fd6e97c99a512f74d46dab2b450fe370eb2f83404ef790298e3fd012cd5c
 PYTHON_DOCKER_SETUP_TYPE = setuptools
 PYTHON_DOCKER_LICENSE = Apache-2.0
 PYTHON_DOCKER_LICENSE_FILES = LICENSE
