From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Tue,  2 Apr 2013 17:37:44 +0200
Subject: [Buildroot] [PATCH] mobile-broadband-provider-info: bump to version
	20120614
Message-ID: <1364917064-1213-1-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 .../mobile_broadband_provider_info.mk                               |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
 
-- 
1.7.10.4
