From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 06 Feb 2014 20:06:27 +0800
Subject: [Buildroot] [PATCH] snmppp: bump to version 3.3.3
Message-ID: <1391688387.362.5.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes snmp++v3.3.3
====================

- Fixed: [APP-30] SNMP++ cannot BER decode Oids starting with 2 and
  with second sub-identifier >39 correctly.
- Fixed: [APP-31] SNMP++ does not encode Oids starting with 2 and
  second sub-ID greater than 47 correctly.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/snmppp/snmppp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index eb1b7b9..2cae093 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.2
+SNMPPP_VERSION = 3.3.3
 SNMPPP_SOURCE = snmp++$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com
 SNMPPP_DEPENDENCIES = openssl host-pkgconf
-- 
1.8.1.2
