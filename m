From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 08:13:03 +0200
Subject: [Buildroot] [git commit] docker-compose: bump version to 1.20.1
Message-ID: <20180331061542.4948A7FC08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=205b786376f1631a877144effb4899818ef7fbe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-compose/docker-compose.hash | 4 ++--
 package/docker-compose/docker-compose.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index abcb424d09..5a5e86abe8 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,4 +1,4 @@
 # md5 from https://pypi.python.org/pypi/docker-compose/json, sha256 locally computed
-md5	0c62ffccfbf22195dc8f168d7ce104b0  docker-compose-1.20.0rc2.tar.gz
-sha256	8f4c7d1d8bef2f137f28332f13187af159ea55ceb58338dfc70cda3800f65d11  docker-compose-1.20.0rc2.tar.gz
+md5	8f9f6d59cc8e65dbfad6fda26b96fde7  docker-compose-1.20.1.tar.gz
+sha256	34c043ebd4c23e4b864812c16b41dad25cec6b675557b180ced52d372e1a9e66  docker-compose-1.20.1.tar.gz
 sha256	552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index d5f71c05a0..52c16dbc79 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 1.20.0rc2
-DOCKER_COMPOSE_SITE = https://pypi.python.org/packages/b9/fe/44a2d249d86ef04ccf792c841fc73ffcf96e6138ca3a926de8ba032cf912
+DOCKER_COMPOSE_VERSION = 1.20.1
+DOCKER_COMPOSE_SITE = https://pypi.python.org/packages/25/4f/4e2b8ff942c9b3d96a81082590617c5c5fa006b066a4181b8d985ea3ac79
 DOCKER_COMPOSE_SETUP_TYPE = setuptools
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
