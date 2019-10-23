From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 23 Oct 2019 09:07:32 +0000
Subject: [Buildroot] [PATCH] package/mobile-broadband-provider-info: bump
 version to 20190618
Message-ID: <20191023090720.102390-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 .../mobile-broadband-provider-info.hash                       | 4 ++--
 .../mobile-broadband-provider-info.mk                         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
index 632fc935a8..bbdfd1f03d 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
@@ -1,4 +1,4 @@
-# http://ftp.acc.umu.se/pub/GNOME/sources/mobile-broadband-provider-info/20190116/mobile-broadband-provider-info-20190116.sha256sum
-sha256	2cba10f82b8e6aec46b871c1f7d20086ecc17e1168f18e588a6a37770fa3c59b  mobile-broadband-provider-info-20190116.tar.xz
+# http://ftp.acc.umu.se/pub/GNOME/sources/mobile-broadband-provider-info/20190618/mobile-broadband-provider-info-20190618.sha256sum
+sha256	c22d64a565d1975b9eecb6ed2eeaef18634bc6f385c8137d05e845d8fb3cce5b  mobile-broadband-provider-info-20190618.tar.xz
 # Locally computed
 sha256	3d510b215a33087b9ceb9592da21575ea1f9f98bd4d983a38e65fe851a552174  COPYING
diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
index ed741f6fa2..5f64f0f35f 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20190116
+MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20190618
 MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
 MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
-- 
2.23.0
