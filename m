From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:30:17 +0200
Subject: [Buildroot] [git commit] mobile-broadband-provider-info: bump to
	version 20120614
Message-ID: <20130421213525.4985A9B793@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f989217bd904be8ab31ba160017a89d2c5afb545
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../mobile_broadband_provider_info.mk              |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
index 8623297..e7c4510 100644
--- a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
+++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
@@ -3,8 +3,9 @@
 # mobile broadband provider info
 #
 #############################################################
-MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20110511
+MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20120614
 MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
+MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
 MOBILE_BROADBAND_PROVIDER_INFO_INSTALL_STAGING = YES
 MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkgconf
 
