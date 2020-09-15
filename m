From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:54:05 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/docker-engine:
 bump to version 19.03.12
Message-ID: <20200915185432.05E028B626@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6f3a3481011e8571d90cdd63a40107cacff10ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f826e8817a15bc855ad64dcbebbd15031e00cec7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 99159f9376..3283e4eb48 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	5ff62d7b3638a275b2c459e53a4d1a7a8fb03dde8305defcd55e05e059e5618d  docker-engine-19.03.11.tar.gz
+sha256	858e4e74ee0097bcbdb71d737e268dfcfd1970efa4a1600354253b02fd403e39  docker-engine-19.03.12.tar.gz
 sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 2f622014ba..61d0bed7fd 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 19.03.11
+DOCKER_ENGINE_VERSION = 19.03.12
 DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
