From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 05 Mar 2014 20:50:06 +0800
Subject: [Buildroot] [PATCH] snmppp: bump to version 3.3.4
Message-ID: <1394023806.313.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes snmp++v3.3.4:
- Fixed: Incorrect time values conversion in += and -= operators of the
  msec class in msec.cpp.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/snmppp/snmppp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 2cae093..e4615d8 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.3
+SNMPPP_VERSION = 3.3.4
 SNMPPP_SOURCE = snmp++$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com
 SNMPPP_DEPENDENCIES = openssl host-pkgconf
-- 
1.8.1.2
