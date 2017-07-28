From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 28 Jul 2017 11:57:50 -0400
Subject: [Buildroot] [PATCH 1/1] janus-gateway: bump version to v0.2.4
Message-ID: <20170728155750.15754-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/janus-gateway/janus-gateway.hash | 2 +-
 package/janus-gateway/janus-gateway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 75c25fc04..9c8db67c6 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 95d24024e4854a43fdc44b422e5472eb298d840abc3260b94a3623eb9e3d300b janus-gateway-v0.2.3.tar.gz
+sha256 b1064036dcdaae804e9e76e58fa7ec639cfdf09c716ece32b5a0a459b48c2ba7 janus-gateway-v0.2.4.tar.gz
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index b32fc9ac5..767b4d54a 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = v0.2.3
+JANUS_GATEWAY_VERSION = v0.2.4
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0
 JANUS_GATEWAY_LICENSE_FILES = COPYING
-- 
2.13.3
