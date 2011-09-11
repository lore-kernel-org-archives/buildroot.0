From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] netsnmp: bump to version 5.6.1.1
Message-ID: <20110912052627.B33478D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b1ddfecdb9952cb3bdda0d35ed4efc0f75e26f75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump netsnmp to version 5.6.1.1 which contains minor fixes.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netsnmp/netsnmp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 5704327..a44f3fe 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NETSNMP_VERSION = 5.6.1
+NETSNMP_VERSION = 5.6.1.1
 NETSNMP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_INSTALL_STAGING = YES
-- 
1.7.3.4
