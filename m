From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Feb 2013 13:14:43 +0100
Subject: [Buildroot] [git commit] network-manager: needs host-intltool
Message-ID: <20130219121448.651C49AB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f230025e846c46dd6424878accdb5183f53f162
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/a37bb8395334814d5c829c27194ad99409baf54b/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/network-manager/network-manager.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 2a68c96..b3715d8 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -8,7 +8,7 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.bz2
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/0.9/
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
-	libgcrypt wireless_tools util-linux
+	libgcrypt wireless_tools util-linux host-intltool
 
 NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
