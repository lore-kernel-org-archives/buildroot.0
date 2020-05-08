From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 12:02:02 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/docker-engine:
 bump version to 19.03.7
Message-ID: <20200508143236.19C7E8D4D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97a6aeea814ba863d9baef9e0755de1c9d8c2a71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e505bc4777a61407115fb3fb918f29e62b3caa88)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 1f1643d377..4c031574af 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	bc5d1ac503e44593be8003ed0ad9c75bf0da535db19837a9338429c438bd4637  docker-engine-19.03.5.tar.gz
+sha256	6621da5b75cecd1f6f57389a4611d3dd00eeedd8765db63ae5538122fdac27da  docker-engine-19.03.7.tar.gz
 sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index eb3a7fd29f..df27cb17b5 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 19.03.5
+DOCKER_ENGINE_VERSION = 19.03.7
 DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
