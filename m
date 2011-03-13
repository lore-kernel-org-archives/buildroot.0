From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Mar 2011 00:10:24 +0100
Subject: [Buildroot] [git commit master 1/1] alsa-lib : bump to 1.0.24.1
Message-ID: <20110313232601.6821290000@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=915ad4cdbba1a52e6f88b9a39d030632a1901f86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/alsa-lib/alsa-lib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index 2085a97..317e78f 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -3,7 +3,7 @@
 # alsa-lib
 #
 #############################################################
-ALSA_LIB_VERSION = 1.0.23
+ALSA_LIB_VERSION = 1.0.24.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_INSTALL_STAGING = YES
-- 
1.7.3.4
