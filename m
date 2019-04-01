From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  1 Apr 2019 20:23:50 +0200
Subject: [Buildroot] [PATCH 6/7] package/docker-engine: bump to version
 v18.09.4
In-Reply-To: <20190401182352.26342-1-peter@korsgaard.com>
References: <20190401182352.26342-1-peter@korsgaard.com>
Message-ID: <20190401182352.26342-7-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index fe7b0d3b94..b268b7f330 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	4babbcbc3e1d7750c61a1e5bee29bd206256948961feaac5b44cabb0c70a50a6  docker-engine-v18.09.2.tar.gz
+sha256	1f4bd15d799420b587024fe3c6d7bd4eb584e509d30c8193db31411579780f2a  docker-engine-v18.09.4.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index e2f59666df..92e364e60d 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v18.09.2
+DOCKER_ENGINE_VERSION = v18.09.4
 DOCKER_ENGINE_SITE = $(call github,docker,engine,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.11.0
