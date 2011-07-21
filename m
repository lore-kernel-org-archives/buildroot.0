From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Jul 2011 14:54:23 -0300
Subject: [Buildroot] [PATCH 3/4] iptables: bump to version 1.4.11.1
In-Reply-To: <1311270864-5771-1-git-send-email-gustavo@zacarias.com.ar>
References: <1311270864-5771-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1311270864-5771-3-git-send-email-gustavo@zacarias.com.ar>
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
index 8652de4..13d2ac3 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPTABLES_VERSION = 1.4.10
+IPTABLES_VERSION = 1.4.11.1
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-- 
1.7.3.4
