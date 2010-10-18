From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Oct 2010 22:42:59 +0200
Subject: [Buildroot] [git commit master 1/1] alsa-lib: bump version
Message-ID: <20101018204329.CA2A18D2F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=01d7afdc929256f14e3662294b2710c336ae5b5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes gst-plugins-base build issue.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/alsa-lib/alsa-lib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index 5447b6c..ee9d9bc 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -3,7 +3,7 @@
 # alsa-lib
 #
 #############################################################
-ALSA_LIB_VERSION = 1.0.22
+ALSA_LIB_VERSION = 1.0.23
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_INSTALL_STAGING = YES
-- 
1.7.1
