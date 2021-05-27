From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 May 2021 17:35:52 +0200
Subject: [Buildroot] [git commit] package/{hostapd,
 wpa_supplicant}: alphabetical order to select openssl features
Message-ID: <20210607144658.551978434F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2a1f906d6adfda9b9ccd2a15ad06c4936d5ec57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/hostapd/Config.in        | 2 +-
 package/wpa_supplicant/Config.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 9d5e8692a2..f4206ceea5 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_HOSTAPD
 	bool "hostapd"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  User space daemon for wireless access points.
 
diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index bc9847c99f..8f095cdf2d 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -1,8 +1,8 @@
 menuconfig BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  WPA supplicant for secure wireless networks
 
