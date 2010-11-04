From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] iptables: bump to version 1.4.10
Message-ID: <20101104230331.CA6518DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=419586ba6fcd2a84bafabb443511afdea74d3097
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iptables/iptables.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 21146bc..1ec2c85 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -3,7 +3,7 @@
 # iptables
 #
 #############################################################
-IPTABLES_VERSION = 1.4.9.1
+IPTABLES_VERSION = 1.4.10
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_DEPENDENCIES = host-pkg-config
@@ -14,7 +14,6 @@ IPTABLES_CONF_OPT += --disable-ipv6
 endif
 
 IPTABLES_AUTORECONF = YES
-IPTABLES_LIBTOOL_PATCH = NO
 
 define IPTABLES_TARGET_SYMLINK_CREATE
 	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables
-- 
1.7.1
