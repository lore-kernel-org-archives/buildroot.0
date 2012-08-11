From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Aug 2012 19:27:26 -0300
Subject: [Buildroot] [PATCH 1/8] iptables: bump to version 1.4.15
Message-ID: <1344724053-10165-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iptables/iptables.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index a5ec6a7..bdef575 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,11 +4,13 @@
 #
 #############################################################
 
-IPTABLES_VERSION = 1.4.14
+IPTABLES_VERSION = 1.4.15
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
 IPTABLES_DEPENDENCIES = host-pkg-config
+IPTABLES_LICENSE = GPLv2
+IPTABLES_LICENSE_FILES = COPYING
 
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
 
-- 
1.7.8.6
