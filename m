From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Jun 2012 13:58:41 +0200
Subject: [Buildroot] [git commit] mediastreamer: fix intltool dependency
Message-ID: <20120604121133.CAE4496E60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f865a2105654f281de1bcc6041b350b131720ace
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c93c1bc01feeea0ff37cb33c81d8712281a01c00

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mediastreamer/mediastreamer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index bea6fb3..8327a55 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -1,7 +1,7 @@
 MEDIASTREAMER_VERSION = 2.8.2
 MEDIASTREAMER_SITE = http://download.savannah.nongnu.org/releases/linphone/mediastreamer
 MEDIASTREAMER_INSTALL_STAGING = YES
-MEDIASTREAMER_DEPENDENCIES = host-pkg-config ortp
+MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkg-config ortp
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 MEDIASTREAMER_CONF_OPT += --enable-alsa
