From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Sep 2010 23:08:40 +0200
Subject: [Buildroot] [git commit master 1/1] iptables: bump to 1.4.9.1
Message-ID: <20100907211001.67EA68A4A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fb848d400fc963102e97edf4fe2b157c5f6d07c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for new kernel 2.6.35 features.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    3 ++-
 package/iptables/iptables.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0350a0e..baee2f6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,8 @@
 	Kconfig infrastructure rebased against 2.6.36-rc1, bringing
 	misc fixes + nconfig and savedefconfig targets.
 
-	Updated/fixed packages: busybox, dropbear, kismet, openvpn
+	Updated/fixed packages: busybox, dropbear, iptables, kismet,
+	openvpn
 
 2010.08: Released August 31th, 2010:
 
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 8e2ebc4..0b7dae1 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -3,7 +3,7 @@
 # iptables
 #
 #############################################################
-IPTABLES_VERSION = 1.4.8
+IPTABLES_VERSION = 1.4.9.1
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_DEPENDENCIES = host-pkg-config
-- 
1.7.1
