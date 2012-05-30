From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 May 2012 11:04:36 +0200
Subject: [Buildroot] [git commit] mobile-broadband-provider-info: use
	release tarball instead of git
Message-ID: <20120531113301.965B696E2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=103b816fe19e2c007bdcf45b59a7a10cfadcc19f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../mobile_broadband_provider_info.mk              |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
index 759d0b8..83f71d3 100644
--- a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
+++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
@@ -4,10 +4,8 @@
 #
 #############################################################
 MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20110511
-MOBILE_BROADBAND_PROVIDER_INFO_SITE = git://git.gnome.org/mobile-broadband-provider-info
+MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
 MOBILE_BROADBAND_PROVIDER_INFO_INSTALL_STAGING = YES
 MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkg-config
 
-MOBILE_BROADBAND_PROVIDER_INFO_AUTORECONF = YES
-
 $(eval $(call AUTOTARGETS))
