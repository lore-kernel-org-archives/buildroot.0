From: Lubomir Rintel <lkundrak@v3.sk>
Date: Wed, 01 May 2019 09:43:43 +0200
Subject: [Buildroot] [PATCH] package/network-manager: update to 1.18.0
Message-ID: <20190501072642.18350-1-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A straightforward package update. Tested.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 7c64e6505e..05ca63b041 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.14/NetworkManager-1.14.6.sha256sum
-sha256 693bcdad15eec7f07a06cbc6e43ddb3b1c13b2d2d23ec165fbb5adf4c3323a5d  NetworkManager-1.14.6.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.18/NetworkManager-1.18.0.sha256sum
+sha256 c6e8df25e5a3c7309bc17664be8971689314884cdd08afdd6b0847d29d2a8ba6  NetworkManager-1.18.0.tar.xz
 # Locally computed
 sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
 sha256 3a2968e3abb4fea464cd8dc1146d71996f9544af91a5f687bc4f3a2932df49b4  libnm-util/COPYING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 96f842f120..c0a9ba0bdb 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.14
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).6
+NETWORK_MANAGER_VERSION_MAJOR = 1.18
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.21.0
