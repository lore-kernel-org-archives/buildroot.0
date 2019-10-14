From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Oct 2019 11:07:00 -0600
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump to version
 1.21.2
Message-ID: <20191014170700.31471-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.hash | 6 +++---
 package/network-manager/network-manager.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index d65b933887..d0e5ddbfe2 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.20.2.sha256sum
-sha256 514e373f2c46536cacca644af859fb535c7a9ac4988a54d861d76f44c87fac84  NetworkManager-1.20.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.21/NetworkManager-1.21.2.sha256sum
+sha256 99813d98a236a0b8198429cd59235cfdb14321f5ea8b16e4dee90bd4d186f412  NetworkManager-1.21.2.tar.xz
 # Locally computed
-sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 64a6d38d1b551a1bfd8509e732cdc9202d2681b61f5b39298f488674d3466fc9  CONTRIBUTING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 529176da9c..10e4b2a0b2 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.20
+NETWORK_MANAGER_VERSION_MAJOR = 1.21
 NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
-- 
2.20.1
