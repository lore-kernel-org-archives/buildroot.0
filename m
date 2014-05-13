From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 May 2014 18:57:04 -0300
Subject: [Buildroot] [PATCH] openvpn: bump to version 2.3.4
Message-ID: <1400018224-2434-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes TLS version interoperability issues.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openvpn/openvpn.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index a989ffe..0355678 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.3
+OPENVPN_VERSION = 2.3.4
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
-- 
1.8.5.5
