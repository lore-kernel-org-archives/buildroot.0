From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 23:46:26 +0200
Subject: [Buildroot] [git commit] mobile-broadband-provider-info: add
	license information
Message-ID: <20130730214614.53F5F9AEBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43cea81de39dc21b8f1d559b59f6842e365c02ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../mobile_broadband_provider_info.mk              |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
index 77f8cba..431e172 100644
--- a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
+++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
@@ -7,6 +7,8 @@
 MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20120614
 MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
 MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
+MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
+MOBILE_BROADBAND_PROVIDER_INFO_LICENSE_FILES = COPYING
 MOBILE_BROADBAND_PROVIDER_INFO_INSTALL_STAGING = YES
 MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkgconf
 
