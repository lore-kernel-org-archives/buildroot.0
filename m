From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Jul 2011 17:14:01 -0300
Subject: [Buildroot] [PATCH 1/3] iptables: bump to version 1.4.12
Message-ID: <1311884043-2473-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump iptables to version 1.4.12 for linux kernel 3.0 support

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iptables/iptables.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index c464e6b..1ee8828 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPTABLES_VERSION = 1.4.11.1
+IPTABLES_VERSION = 1.4.12
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-- 
1.7.3.4
