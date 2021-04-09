From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  9 Apr 2021 18:56:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager-openvpn: bump to
 version 1.8.14
Message-ID: <20210409165642.3388274-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://gitlab.gnome.org/GNOME/NetworkManager-openvpn/-/blob/1.8.14/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../network-manager-openvpn/network-manager-openvpn.hash    | 6 +++---
 package/network-manager-openvpn/network-manager-openvpn.mk  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager-openvpn/network-manager-openvpn.hash b/package/network-manager-openvpn/network-manager-openvpn.hash
index 0c52fb8d13..d0cbc7ca87 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.hash
+++ b/package/network-manager-openvpn/network-manager-openvpn.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/NetworkManager-openvpn/1.8/NetworkManager-openvpn-1.8.10.sha256sum
-sha256 af3cc86ba848d21b4ac807a09d575de11335ba4df8ce6fdb089212e77c2231ef  NetworkManager-openvpn-1.8.10.tar.xz
+# From https://download.gnome.org/sources/NetworkManager-openvpn/1.8/NetworkManager-openvpn-1.8.14.sha256sum
+sha256  e7419053fc3b5a7e25f1a7517c313ad4531b6ea280255524ebb85a70c76fdbeb  NetworkManager-openvpn-1.8.14.tar.xz
 # Locally computed
-sha256 c39e345d992dfba62db265f8c6d6ff1d90c61d92876635ae05adbfa2f45fff46  COPYING
+sha256  c39e345d992dfba62db265f8c6d6ff1d90c61d92876635ae05adbfa2f45fff46  COPYING
diff --git a/package/network-manager-openvpn/network-manager-openvpn.mk b/package/network-manager-openvpn/network-manager-openvpn.mk
index 1a872dc127..d5d4c5da42 100644
--- a/package/network-manager-openvpn/network-manager-openvpn.mk
+++ b/package/network-manager-openvpn/network-manager-openvpn.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.8
-NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).10
+NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).14
 NETWORK_MANAGER_OPENVPN_SOURCE = NetworkManager-openvpn-$(NETWORK_MANAGER_OPENVPN_VERSION).tar.xz
 NETWORK_MANAGER_OPENVPN_SITE = https://download.gnome.org/sources/NetworkManager-openvpn/$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR)
 NETWORK_MANAGER_OPENVPN_DEPENDENCIES = network-manager openvpn
-- 
2.30.2
