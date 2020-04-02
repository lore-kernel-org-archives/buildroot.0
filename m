From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2020 21:55:13 +0200
Subject: [Buildroot] [git commit] package/janus-gateway: bump version to
 0.9.2
Message-ID: <20200402195004.4097488061@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf76b1f5eebca3b2d54283fd7478a6b15d8bcfba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
