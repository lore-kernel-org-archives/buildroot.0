From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 15 Jun 2017 08:13:08 -0400
Subject: [Buildroot] [PATCH 1/7] janus-gateway: bump to version 0.2.3
Message-ID: <20170615121314.1485-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/janus-gateway/janus-gateway.hash | 2 +-
 package/janus-gateway/janus-gateway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 546aff9..75c25fc 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f5b1909fd9b8546f8be518f7c682b80916a8204c95f23a95c720524df62cca34 janus-gateway-v0.2.2.tar.gz
+sha256 95d24024e4854a43fdc44b422e5472eb298d840abc3260b94a3623eb9e3d300b janus-gateway-v0.2.3.tar.gz
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 7c35bfb..b79e340 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = v0.2.2
+JANUS_GATEWAY_VERSION = v0.2.3
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0
 JANUS_GATEWAY_LICENSE_FILES = COPYING
-- 
2.9.4
