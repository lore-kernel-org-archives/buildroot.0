From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 16:12:13 +0200
Subject: [Buildroot] [git commit] docker-engine: bump to version 17.03.1-ce
Message-ID: <20170401144621.A414D8227F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49d8153ee570f47c1d9e2356d082b56170c5a724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 127d2b9..dfa3248 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d8e91af5b2799cafac113a400d4db9c6abe01ae823f378d2f4d3d3e55e48eaf6	docker-engine-v17.03.0-ce.tar.gz
+sha256	a8f1eefadf3966885ad0579facfc2017cca7dd3a0b20d086dfd798168716cb83	docker-engine-v17.03.1-ce.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index bf6f6a4..5ff595e 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v17.03.0-ce
-DOCKER_ENGINE_COMMIT = 60ccb2265b0574d6c1c1090876a1d1ab32bed60e
+DOCKER_ENGINE_VERSION = v17.03.1-ce
+DOCKER_ENGINE_COMMIT = c6d412e329c85f32a4b2269b49aaa0794affcf88
 DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
