From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 21:49:50 +0200
Subject: [Buildroot] [git commit] docker-engine: bump to version 17.04.0-ce
Message-ID: <20170406195000.A5DFB81E79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00b1f4c0d233182ff0b4db4d5321ec05d1550ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index dfa3248..aa7c3ac 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a8f1eefadf3966885ad0579facfc2017cca7dd3a0b20d086dfd798168716cb83	docker-engine-v17.03.1-ce.tar.gz
+sha256	b6ee0aa93ecea44e956d3627907e10557b3ec37d13ddfb40e436656e5037c640	docker-engine-v17.04.0-ce.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 5ff595e..db65e2d 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v17.03.1-ce
-DOCKER_ENGINE_COMMIT = c6d412e329c85f32a4b2269b49aaa0794affcf88
+DOCKER_ENGINE_VERSION = v17.04.0-ce
+DOCKER_ENGINE_COMMIT = 4845c567eb35d68f35b0b1713a09b0c8d47fe67e
 DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
