From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Aug 2016 17:53:23 -0300
Subject: [Buildroot] [PATCH] openvpn: bump to version 2.3.12
Message-ID: <1471985603-16836-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 179198e..ce005d3 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	0f5f1ca1dc5743fa166d93dd4ec952f014b5f33bafd88f0ea34b455cae1434a7 	openvpn-2.3.11.tar.xz
+sha256	13b963414e2430215981868c77b9795d93653ee535a2d73576f7bb2c28200abc 	openvpn-2.3.12.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index f3985cd..0e59fdc 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.11
+OPENVPN_VERSION = 2.3.12
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
-- 
2.7.3
