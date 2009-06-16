From: Will Newton <will.newton@gmail.com>
Date: Tue, 16 Jun 2009 21:45:01 +0100
Subject: [Buildroot] [git commit] gstreamer: Bump version to 0.10.23.
Message-ID: <20090618085944.F1A657781D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da99a9eedefbc6611bfd1237de5db33fd3e3f137
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closes #391.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/multimedia/gstreamer/gstreamer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 821a233..53f1f75 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -3,7 +3,7 @@
 # gstreamer
 #
 #############################################################
-GSTREAMER_VERSION = 0.10.22
+GSTREAMER_VERSION = 0.10.23
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
-- 
1.6.0.6
