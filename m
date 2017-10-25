From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:45:07 +0200
Subject: [Buildroot] [git commit] janus-gateway: bump to v0.2.5
Message-ID: <20171025073940.B070380447@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7632237932611e50097612175d6489e68ee0926c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janus-gateway/janus-gateway.hash | 3 ++-
 package/janus-gateway/janus-gateway.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 9c8db67..1cb325c 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 b1064036dcdaae804e9e76e58fa7ec639cfdf09c716ece32b5a0a459b48c2ba7 janus-gateway-v0.2.4.tar.gz
+sha256 09610dc02ff0a1f23af0397baaa26a3cd88b3742d35b2e49849f099885cdcf08 janus-gateway-v0.2.5.tar.gz
+sha256 0a884af515b4593503f6f0c9b424db3945bd77eaa2644d25f45eb93a412b3c19 COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 767b4d5..bf3e590 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = v0.2.4
+JANUS_GATEWAY_VERSION = v0.2.5
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0
 JANUS_GATEWAY_LICENSE_FILES = COPYING
