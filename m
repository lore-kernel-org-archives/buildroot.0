From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 13:36:09 +0200
Subject: [Buildroot] [git commit] gstreamer1: bump version
Message-ID: <20140424113619.7938A9C9CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9dc0d241d7f4c0cbc12d2ca436391a10bedd2752
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug reports fixed in this release:

      * 724373 : Queue2 truncates its temp file when pipeline is paused
      * 725517 : docs: Fix typos and remove unknown annotations
      * 725809 : ghostpad: rare crash because of missing reference count on its target pad
      * 727253 : parse: Bison generated file included in the release tarballs causes compile errors
      * 727883 : baseparse: Memory leak of queue frames

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 7ef357e..bf23582 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.2.3
+GSTREAMER1_VERSION = 1.2.4
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
