From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 27 Dec 2017 12:41:27 -0500
Subject: [Buildroot] [PATCH 1/1] janus-gateway: bump to v0.2.6
Message-ID: <20171227174127.21207-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/janus-gateway/janus-gateway.hash | 2 +-
 package/janus-gateway/janus-gateway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 1cb325c41d..f84ed8b6db 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 09610dc02ff0a1f23af0397baaa26a3cd88b3742d35b2e49849f099885cdcf08 janus-gateway-v0.2.5.tar.gz
+sha256 35cbbd5e7b7067e3a0b5ba221ea845814e5b59c733302f88fea80bcf98ce416f janus-gateway-v0.2.6.tar.gz
 sha256 0a884af515b4593503f6f0c9b424db3945bd77eaa2644d25f45eb93a412b3c19 COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index bf3e590ac5..c37cda0860 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = v0.2.5
+JANUS_GATEWAY_VERSION = v0.2.6
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0
 JANUS_GATEWAY_LICENSE_FILES = COPYING
-- 
2.14.3
