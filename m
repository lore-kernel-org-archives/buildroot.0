From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Mar 2013 13:50:40 -0300
Subject: [Buildroot] [PATCH 6/6] iptables: bump to version 1.4.18
In-Reply-To: <1362415840-9634-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362415840-9634-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362415840-9634-6-git-send-email-gustavo@zacarias.com.ar>
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
index 518b90e..ed11fdc 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPTABLES_VERSION = 1.4.17
+IPTABLES_VERSION = 1.4.18
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-- 
1.7.12.4
