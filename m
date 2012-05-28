From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 May 2012 11:50:06 -0300
Subject: [Buildroot] [PATCH 4/4] iptables: bump to version 1.4.14
In-Reply-To: <1338216606-21082-1-git-send-email-gustavo@zacarias.com.ar>
References: <1338216606-21082-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1338216606-21082-4-git-send-email-gustavo@zacarias.com.ar>
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
index 87578d5..5c6a8a6 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPTABLES_VERSION = 1.4.13
+IPTABLES_VERSION = 1.4.14
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-- 
1.7.3.4
