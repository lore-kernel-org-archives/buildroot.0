From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat,  3 Sep 2016 20:21:56 -0400
Subject: [Buildroot] [PATCH 1/1] libwebsockets: bump to version 2.0.2
Message-ID: <1472948516-2385-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index c931a0d..dc44da5 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  e91f59fb6238462b4ffdfef2482239558b8a02198c9c6076eb3f86eb1c4e935d  libwebsockets-v1.7.5.tar.gz
+sha256  43865604debd06686ac4d8d0783976c4e10dd519ccd5c94e1b53878ec6178a59  libwebsockets-v2.0.2.tar.gz
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 5bb7ae4..a9b4a25 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.7.5
+LIBWEBSOCKETS_VERSION = v2.0.2
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
1.9.1
