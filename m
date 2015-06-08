From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Jun 2015 16:20:31 -0300
Subject: [Buildroot] [PATCH] openvpn: bump to version 2.3.7
Message-ID: <1433791231-9201-1-git-send-email-gustavo@zacarias.com.ar>
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
index 38579ab..9a917b9 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	adae2ef34c9225347a844683b88caa87cde0979b7f2390fd1776db0eb51510ed 	openvpn-2.3.6.tar.xz
+sha256	4062ce972500f98988e9c6e9dd1040be25582f0d49aa7e69f3f4cff96e9aebee 	openvpn-2.3.7.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 74e5783..336d491 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.6
+OPENVPN_VERSION = 2.3.7
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
-- 
2.3.6
