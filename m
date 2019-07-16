From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 16 Jul 2019 11:37:08 -0400
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: bump to version 0.7.3
Message-ID: <20190716153709.19420-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/janus-gateway/janus-gateway.hash | 2 +-
 package/janus-gateway/janus-gateway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 5e531da0b9..784c43d252 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 de8f4e3e8b19a099c903b5db7813dbbf442084af686c9922796736d42c8a8c98 janus-gateway-0.6.3.tar.gz
+sha256 d34868c259f388105fe16a5cd304a5684d45b1eddbe436293f4aa2178c0e4b6e janus-gateway-0.7.3.tar.gz
 sha256 0a884af515b4593503f6f0c9b424db3945bd77eaa2644d25f45eb93a412b3c19 COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index a2ecc77a00..09cf9e5613 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 0.6.3
+JANUS_GATEWAY_VERSION = 0.7.3
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0
 JANUS_GATEWAY_LICENSE_FILES = COPYING
-- 
2.21.0
