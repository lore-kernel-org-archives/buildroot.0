From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 23:52:47 +0100
Subject: [Buildroot] [git commit] docker-engine: bump to version 17.03.0-ce
Message-ID: <20170303225251.BB42B81909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22ab6d84ff700928aabf6115956fe7f63750c30c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index bc1b846..127d2b9 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	2730e7cc15492de8f1d6f9510c64620fc9004c8afc1410bf3ebac9fc3f9f83c6	docker-engine-v1.13.1.tar.gz
+sha256	d8e91af5b2799cafac113a400d4db9c6abe01ae823f378d2f4d3d3e55e48eaf6	docker-engine-v17.03.0-ce.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 0701dce..7f7840b 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v1.13.1
-DOCKER_ENGINE_COMMIT = 092cba3727bb9b4a2f0e922cd6c0f93ea270e363
+DOCKER_ENGINE_VERSION = v17.03.0-ce
+DOCKER_ENGINE_COMMIT = 60ccb2265b0574d6c1c1090876a1d1ab32bed60e
 DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
