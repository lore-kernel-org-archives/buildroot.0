From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 30 Mar 2020 09:03:01 -0700
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: bump version to 0.9.2
Message-ID: <20200330160302.514526-1-aduskett@gmail.com>
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
index b74ec2511f..c61ffcd5b6 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 668758f06e2a158f83b89d17aad322959221fbeadcc5611c6f7a38ff76fd2896 janus-gateway-0.8.1.tar.gz
+sha256 b6829edaf25862fbf613e2c3d2be7cad29943c0bb1ea5d1b935a07abfee37245 janus-gateway-0.9.2.tar.gz
 sha256 91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6 COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index d17a80f788..bbc7f95ee1 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 0.8.1
+JANUS_GATEWAY_VERSION = 0.9.2
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
-- 
2.25.1
