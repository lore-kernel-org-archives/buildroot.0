From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 15:50:54 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] docker-engine: security
	bump to version 1.12.6
Message-ID: <20170123145719.2E9FF81EA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af96b7fd097c7ddf1718085c1c66d3a2d85ff031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixes runC privilege escalation (CVE-2016-9962).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 157ddf77e403c6ee00faef44fc32f8f679964204)
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 6697d8a..5e09453 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 81b337368efafb631a75f6ad5469413fd5828ce672592c374adf894dc05abd38  docker-engine-v1.12.5.tar.gz
+sha256 0413f3513c2a6842ed9cf837154c8a722e9b34cb36b33430348489baa183707e  docker-engine-v1.12.6.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 2cd71dd..d575662 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v1.12.5
-DOCKER_ENGINE_COMMIT = 7392c3b0ce0f9d3e918a321c66668c5d1ef4f689
+DOCKER_ENGINE_VERSION = v1.12.6
+DOCKER_ENGINE_COMMIT = 78d18021ecba00c00730dec9d56de6896f9e708d
 DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
