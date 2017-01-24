From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 11:53:11 +1300
Subject: [Buildroot] [git commit] janus-gateway: bump to version v0.2.1
Message-ID: <20170124225608.1C1B27FB54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c78dbd06317f70afa72d2f09b74b2aa14b5fd9cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
