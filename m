From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 May 2015 11:49:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/snmppp: Update site url
Message-ID: <1432201773-14371-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/snmppp/snmppp.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 74acee4..147af60 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -6,7 +6,7 @@
 
 SNMPPP_VERSION = 3.3.4
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
-SNMPPP_SITE = http://www.agentpp.com
+SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
 SNMPPP_INSTALL_STAGING = YES
 # no configure script in tarball
-- 
1.7.10.4
