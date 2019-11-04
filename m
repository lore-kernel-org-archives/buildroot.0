From: Lubomir Rintel <lkundrak@v3.sk>
Date: Mon,  4 Nov 2019 14:03:45 +0100
Subject: [Buildroot] [PATCH 2/2] package/network-manager: bump to version
 1.20.4
In-Reply-To: <20191104130345.3799456-1-lkundrak@v3.sk>
References: <20191104130345.3799456-1-lkundrak@v3.sk>
Message-ID: <20191104130345.3799456-2-lkundrak@v3.sk>
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
index d65b933887..ca8b0a2f43 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.20.2.sha256sum
-sha256 514e373f2c46536cacca644af859fb535c7a9ac4988a54d861d76f44c87fac84  NetworkManager-1.20.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.20.4.sha256sum
+sha256 a3d738b7e702d9548b522a5781a5fb75ba69363f468c400ddd885ca65035914c  NetworkManager-1.20.4.tar.xz
 # Locally computed
 sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
 sha256 64a6d38d1b551a1bfd8509e732cdc9202d2681b61f5b39298f488674d3466fc9  CONTRIBUTING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 529176da9c..e913d69927 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.20
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.23.0
