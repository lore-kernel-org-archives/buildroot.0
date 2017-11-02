From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu,  2 Nov 2017 21:15:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/network-manager: Bump to version
 1.8.4
Message-ID: <20171102201505.19576-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 2861aedc87..3262ad3b00 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/NetworkManager/1.8/NetworkManager-1.8.0.sha256sum
-sha256 fa5a5c6a36cdf95b12df34cc575bd61a74f297ede9be22cac4807a1aff3cf69e  NetworkManager-1.8.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.8/NetworkManager-1.8.4.sha256sum
+sha256 625e2eb36386dcae599075226200140d010f213b47f7202d83b3b1a202029212  NetworkManager-1.8.4.tar.xz
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 4a05a658b9..caf462e26e 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.8
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.14.2
