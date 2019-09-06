From: Lubomir Rintel <lkundrak@v3.sk>
Date: Fri,  6 Sep 2019 11:25:53 +0200
Subject: [Buildroot] [PATCH] package/network-manager: bump to version 1.20.2
Message-ID: <20190906092553.2610490-1-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A straightforward bump. Tested.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index c0692b594b..1c3e7dfe3d 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.20.0.sha256sum
-sha256 b7e605055491ea8ef433bc149d55349111b9c789ad1cd0578f19ece39b1ac7c4  NetworkManager-1.20.0.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.20.2.sha256sum
+sha256 514e373f2c46536cacca644af859fb535c7a9ac4988a54d861d76f44c87fac84  NetworkManager-1.20.2.tar.xz
 # Locally computed
 sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
 sha256 3a2968e3abb4fea464cd8dc1146d71996f9544af91a5f687bc4f3a2932df49b4  libnm-util/COPYING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 6cadc830ab..965f3d2888 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.20
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.21.0
