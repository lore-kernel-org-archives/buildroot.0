From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Jan 2011 15:11:51 -0300
Subject: [Buildroot] [PATCH 3/3] openvpn: bump to version 2.1.4
In-Reply-To: <1295028711-28716-1-git-send-email-gustavo@zacarias.com.ar>
References: <1295028711-28716-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1295028711-28716-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openvpn/openvpn.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index ba91690..89118b1 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-OPENVPN_VERSION = 2.1.3
-OPENVPN_SITE = http://openvpn.net/release
+OPENVPN_VERSION = 2.1.4
+OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_CONF_OPT = --enable-small
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
1.7.3.4
