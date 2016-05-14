From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 May 2016 10:33:48 -0300
Subject: [Buildroot] [PATCH v2 2/2] openvpn: security bump to version 2.3.11
In-Reply-To: <1463232828-2957-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463232828-2957-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1463232828-2957-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed port-share bug with DoS potential.
Fix buffer overflow by user supplied data.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Change for v2: none.

 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 4ab916e..179198e 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	52f16bef3a02369682f1464fbd2821070c98d0bd993f4c46c764e87375abdcc1 	openvpn-2.3.9.tar.xz
+sha256	0f5f1ca1dc5743fa166d93dd4ec952f014b5f33bafd88f0ea34b455cae1434a7 	openvpn-2.3.11.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 1d06636..f3985cd 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.9
+OPENVPN_VERSION = 2.3.11
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
-- 
2.7.3
