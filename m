From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Thu, 24 Jan 2019 10:52:46 +0000
Subject: [Buildroot] [PATCH] package/mobile-broadband-provider-info: bump to
 version 20190116
Message-ID: <20190124105223.64523-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 .../mobile-broadband-provider-info.hash                     | 6 ++++--
 .../mobile-broadband-provider-info.mk                       | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
index 5ab2e318fe..632fc935a8 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
@@ -1,2 +1,4 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/20151214/mobile-broadband-provider-info-20151214.sha256sum
-sha256	8ae45d6f10fed9750e259935804c4f40a4372bb119f0504187e4221896b205a4	mobile-broadband-provider-info-20151214.tar.xz
+# http://ftp.acc.umu.se/pub/GNOME/sources/mobile-broadband-provider-info/20190116/mobile-broadband-provider-info-20190116.sha256sum
+sha256	2cba10f82b8e6aec46b871c1f7d20086ecc17e1168f18e588a6a37770fa3c59b  mobile-broadband-provider-info-20190116.tar.xz
+# Locally computed
+sha256	3d510b215a33087b9ceb9592da21575ea1f9f98bd4d983a38e65fe851a552174  COPYING
diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
index 1a68708d45..ed741f6fa2 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20151214
+MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20190116
 MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
 MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
-- 
2.20.1
