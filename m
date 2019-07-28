From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 09:41:59 +0200
Subject: [Buildroot] [git commit] package/network-manager: bump to 1.18.2
Message-ID: <20190728074027.70EDB83D20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0d7b1b8bd08f3cabc2e040486ed725f0dfeec12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A straightforward package update. Tested.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 05ca63b041..c4baf071ab 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.18/NetworkManager-1.18.0.sha256sum
-sha256 c6e8df25e5a3c7309bc17664be8971689314884cdd08afdd6b0847d29d2a8ba6  NetworkManager-1.18.0.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.18/NetworkManager-1.18.2.sha256sum
+sha256 4dd97ca974cd1f97990746527258f551f4257cbf011fecd01d10b7d74a6fa5c3  NetworkManager-1.18.2.tar.xz
 # Locally computed
 sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
 sha256 3a2968e3abb4fea464cd8dc1146d71996f9544af91a5f687bc4f3a2932df49b4  libnm-util/COPYING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index f9893680fa..2d35c84f39 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.18
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
-NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
+NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp libgudev
