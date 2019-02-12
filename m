From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:21:39 +0100
Subject: [Buildroot] [git commit] docker-engine: bump to v18.09.2
Message-ID: <20190212202655.BC34888FEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=087e5147c32ed8e75e462e4ea5c0cf2fd3c40be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 1e3939f240..fe7b0d3b94 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	b5278b3f2b460ea61f47833abd2a844f348b4518e73f309294ad178c205a48e1  docker-engine-v18.09.0.tar.gz
+sha256	4babbcbc3e1d7750c61a1e5bee29bd206256948961feaac5b44cabb0c70a50a6  docker-engine-v18.09.2.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index aae44ab6df..e2f59666df 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v18.09.0
+DOCKER_ENGINE_VERSION = v18.09.2
 DOCKER_ENGINE_SITE = $(call github,docker,engine,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
