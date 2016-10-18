From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 17 Oct 2016 21:51:46 -0400
Subject: [Buildroot] [PATCH 1/1] libwebsockets: bump to version 2.1.0
Message-ID: <1476755506-2530-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.net/results/d88/d88889ba30444e73cfb12ae1357db25ff6a3a4fb/

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index dc44da5..cbd1101 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  43865604debd06686ac4d8d0783976c4e10dd519ccd5c94e1b53878ec6178a59  libwebsockets-v2.0.2.tar.gz
+sha256  bcc96aaa609daae4d3f7ab1ee480126709ef4f6a8bf9c85de40aae48e38cce66  libwebsockets-v2.1.0.tar.gz
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index a9b4a25..bf46291 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v2.0.2
+LIBWEBSOCKETS_VERSION = v2.1.0
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
1.9.1
