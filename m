From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Jun 2013 11:14:26 -0300
Subject: [Buildroot] [PATCH 2/5] openvpn: bump to version 2.3.2
In-Reply-To: <1371046469-19194-1-git-send-email-gustavo@zacarias.com.ar>
References: <1371046469-19194-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1371046469-19194-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openvpn/openvpn.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index db61c83..0756ec4 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.1
+OPENVPN_VERSION = 2.3.2
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_CONF_OPT = --disable-plugin-auth-pam --enable-iproute2
-- 
1.8.1.5
