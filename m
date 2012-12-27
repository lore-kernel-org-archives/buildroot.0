From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Dec 2012 12:39:05 -0300
Subject: [Buildroot] [PATCH 1/6] iptables: bump to version 1.4.17
Message-ID: <1356622750-20657-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iptables/iptables.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 3243b3f..518b90e 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPTABLES_VERSION = 1.4.16.3
+IPTABLES_VERSION = 1.4.17
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-- 
1.7.8.6
