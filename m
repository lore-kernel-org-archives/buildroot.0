From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  2 Mar 2017 19:58:27 +0100
Subject: [Buildroot] [PATCH 3/3] docker-engine: bump to version 17.03.0-ce
In-Reply-To: <1488481107-97917-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1488481107-97917-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <1488481107-97917-3-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.5.0
