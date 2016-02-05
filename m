From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri,  5 Feb 2016 19:37:00 +0100
Subject: [Buildroot] [PATCH 1/1] network-manager: bump to version 1.0.10
Message-ID: <1454697420-30849-1-git-send-email-petr.vorel@gmail.com>
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
index 5e9e0c9..c259b5a 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.6.sha256sum
-sha256  38ea002403e3b884ffa9aae25aea431d2a8420f81f4919761c83fb92648254bd  NetworkManager-1.0.6.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.10.sha256sum
+sha256  1bcfce8441dfd9f432a100d06b54f3831a2275cccc3b74b1b4c09a011e179fbc  NetworkManager-1.0.10.tar.xz
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 98879d6..b49f3b8 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.0
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).6
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).10
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.7.0
