From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 May 2019 23:34:19 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/docker-engine:
 bump to version 18.09.5
Message-ID: <20190508214035.78C34813E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5eaa6df8ba38d033c27fbb1c75b016478565f1bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0e70d7c761fbaaecbc482dcba480151b7d3e11d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index b268b7f330..28f1d72136 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	1f4bd15d799420b587024fe3c6d7bd4eb584e509d30c8193db31411579780f2a  docker-engine-v18.09.4.tar.gz
+sha256	f6c1f2cff88c1f143fe9c16ea6555eace68ef17a5b7803dc5d5fa0a1f45a3a97  docker-engine-v18.09.5.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 92e364e60d..7b0f451ee9 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v18.09.4
+DOCKER_ENGINE_VERSION = v18.09.5
 DOCKER_ENGINE_SITE = $(call github,docker,engine,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
