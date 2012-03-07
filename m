From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:27 +0100
Subject: [Buildroot] [RFC v2 27/31] netsnmp: define license
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-28-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/netsnmp/netsnmp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 959e39f..fd159e7 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -7,6 +7,8 @@
 NETSNMP_VERSION = 5.7.1
 NETSNMP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
+NETSNMP_LICENSE = BSD
+NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
 NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
-- 
1.7.5.4
