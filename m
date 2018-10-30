From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 30 Oct 2018 22:20:52 +0100
Subject: [Buildroot] [PATCH 1/2] package/network-manager: bump version to
 1.10.8
Message-ID: <20181030212053.9833-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/network-manager/network-manager.hash | 7 +++++--
 package/network-manager/network-manager.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 8fedc64729..3439439175 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,2 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.10/NetworkManager-1.10.2.sha256sum
-sha256 169c34f50770e3c96b431f7d2cff654455246f2e6ccd46eccfb4454d4595625b  NetworkManager-1.10.2.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.10/NetworkManager-1.10.8.sha256sum
+sha256 eb4ac8ce75fed5ec804f409caec7b54342d4e01512baf7d7fc119fd40ac8a938  NetworkManager-1.10.8.tar.xz
+# Locally computed
+sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
+sha256 3a2968e3abb4fea464cd8dc1146d71996f9544af91a5f687bc4f3a2932df49b4  libnm-util/COPYING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index a520aad9c0..2b9f68a030 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.10
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.19.1
