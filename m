From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:42 +0200
Subject: [Buildroot] [PATCH v3 21/22] netsnmp: define license
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-21-git-send-email-luca@lucaceresoli.net>
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
index 448e3fd..125782f 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -7,6 +7,8 @@
 NETSNMP_VERSION = 5.7.1
 NETSNMP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
+NETSNMP_LICENSE = Various BSD-like
+NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
 NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
-- 
1.7.5.4
