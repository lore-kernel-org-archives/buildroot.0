From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 12:00:33 +0200
Subject: [Buildroot] [git commit] libwebsockets: bump to version 2.1.0
Message-ID: <20161018100036.2060E81D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d49fed8fe21d0b9173157b7d096ace43a8964992
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.net/results/d88/d88889ba30444e73cfb12ae1357db25ff6a3a4fb/

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
