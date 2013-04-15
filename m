From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 15 Apr 2013 08:35:03 +0100
Subject: [Buildroot] [PATCH] mobile-broadband-provider-info: add license
	information
Message-ID: <1366011303-30960-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 .../mobile_broadband_provider_info.mk                               |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
index 8623297..d930fad 100644
--- a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
+++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
@@ -3,8 +3,11 @@
 # mobile broadband provider info
 #
 #############################################################
+
 MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20110511
 MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
+MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
+MOBILE_BROADBAND_PROVIDER_INFO_LICENSE_FILES = COPYING
 MOBILE_BROADBAND_PROVIDER_INFO_INSTALL_STAGING = YES
 MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkgconf
 
-- 
1.7.10.4
