From: Fabian Mewes <architekt@coding4coffee.org>
Date: Mon,  1 Dec 2014 22:26:29 +0100
Subject: [Buildroot] [PATCH] openvpn: CVE-2014-8104: bump to version 2.3.6
Message-ID: <1417469189-26783-1-git-send-email-architekt@coding4coffee.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see
https://community.openvpn.net/openvpn/wiki/SecurityAnnouncement-97597e732b

Signed-off-by: Fabian Mewes <architekt@coding4coffee.org>
---
 package/openvpn/openvpn.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e0dba35..d9871ef 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.5
+OPENVPN_VERSION = 2.3.6
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
-- 
1.7.10.4
