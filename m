From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 31 May 2013 09:27:16 -0300
Subject: [Buildroot] [PATCH] iptables: bump to version 1.4.19.1
Message-ID: <1370003236-26655-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iptables/iptables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index ed11fdc..5a21412 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPTABLES_VERSION = 1.4.18
+IPTABLES_VERSION = 1.4.19.1
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-- 
1.8.1.5
