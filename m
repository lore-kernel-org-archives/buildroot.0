From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 10:42:56 +0200
Subject: [Buildroot] [git commit] package/docker-engine: bump version to
 19.03.8
Message-ID: <20200512082850.E93109002C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21e4b435446944f1d571fea70cd7505fa453d533
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:
- Improve mitigation for CVE-2019-14271 for some nscd configuration.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 4c031574af..c23eea90a8 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	6621da5b75cecd1f6f57389a4611d3dd00eeedd8765db63ae5538122fdac27da  docker-engine-19.03.7.tar.gz
+sha256	13ec45ad45091111bd566aca9d81989b3f05e0625dab68d33c3ad81ff924172f  docker-engine-19.03.8.tar.gz
 sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index df27cb17b5..78f6c1261c 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 19.03.7
+DOCKER_ENGINE_VERSION = 19.03.8
 DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
