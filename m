From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Oct 2016 12:09:23 -0300
Subject: [Buildroot] [PATCH] mobile-broadband-provider-info: bump to version
	20151214
Message-ID: <1477667363-4907-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../mobile-broadband-provider-info.hash                               | 4 ++--
 .../mobile-broadband-provider-info/mobile-broadband-provider-info.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
index 54c7a99..5ab2e31 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/20120614/mobile-broadband-provider-info-20120614.sha256sum
-sha256	72507a732e0cd16cf27424bb094b1c7a03e2206c119ad124722a283e587755f1	mobile-broadband-provider-info-20120614.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/20151214/mobile-broadband-provider-info-20151214.sha256sum
+sha256	8ae45d6f10fed9750e259935804c4f40a4372bb119f0504187e4221896b205a4	mobile-broadband-provider-info-20151214.tar.xz
diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
index f2a1136..1a68708 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20120614
+MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20151214
 MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
 MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
-- 
2.7.3
