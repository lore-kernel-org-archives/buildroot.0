From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 23 Dec 2018 18:01:22 -0500
Subject: [Buildroot] [PATCH 1/1] janus-gateway: bump version to v0.5.0
Message-ID: <20181223230122.43749-1-aduskett@gmail.com>
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
index f84ed8b6db..9b13e0f0fc 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 35cbbd5e7b7067e3a0b5ba221ea845814e5b59c733302f88fea80bcf98ce416f janus-gateway-v0.2.6.tar.gz
+sha256 c9c3b741a5d9f956845d5094c211690178cc0d630a7b23b870437c88a7e4ed3b janus-gateway-v0.5.0.tar.gz
 sha256 0a884af515b4593503f6f0c9b424db3945bd77eaa2644d25f45eb93a412b3c19 COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 261fc25202..cea06b754e 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = v0.2.6
+JANUS_GATEWAY_VERSION = v0.5.0
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0
 JANUS_GATEWAY_LICENSE_FILES = COPYING
-- 
2.19.2
