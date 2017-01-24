From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Jan 2017 15:31:30 -0500
Subject: [Buildroot] [V2 01/10] janus-gateway: bump to version v0.2.1
Message-ID: <20170124203139.15919-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v1 -> v2: No changes

 package/janus-gateway/janus-gateway.hash | 2 +-
 package/janus-gateway/janus-gateway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index fece97a..68b9c31 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4d341a54d3eae5506c3e2409f4a6e4f5159dc4ece3197aaf077d3eb997e69a10 janus-gateway-v0.1.0.tar.gz
+sha256 5d071592faca2a1574b996b4ca07b6c9e02cd42a719b0dbb4bfb5dfde8d55ff3 janus-gateway-v0.2.1.tar.gz
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index d65ab19..4b87b33 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = v0.1.0
+JANUS_GATEWAY_VERSION = v0.2.1
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPLv3
 JANUS_GATEWAY_LICENSE_FILES = COPYING
-- 
2.9.3
