From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Apr 2015 08:12:38 -0300
Subject: [Buildroot] [PATCH] network-manager: adjust license info
Message-ID: <1429787558-14581-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgsystem is gone, so remove that section. Fixes:
http://autobuild.buildroot.net/results/4b9/4b9826f540b8da43c0434769ad9485529cf762e6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/network-manager/network-manager.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 937a446..c37c9ea 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -11,8 +11,8 @@ NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(N
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp
-NETWORK_MANAGER_LICENSE = GPLv2+ (app), LGPLv2+ (libnm-util, libgsystem)
-NETWORK_MANAGER_LICENSE_FILES = COPYING libnm-util/COPYING libgsystem/COPYING
+NETWORK_MANAGER_LICENSE = GPLv2+ (app), LGPLv2+ (libnm-util)
+NETWORK_MANAGER_LICENSE_FILES = COPYING libnm-util/COPYING
 
 NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
-- 
2.0.5
