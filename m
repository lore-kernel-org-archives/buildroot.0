From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 30 May 2017 19:01:23 +0200
Subject: [Buildroot] [PATCH 1/6] agentpp: fix help text format
Message-ID: <1496163688-20870-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/agentpp/Config.in | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/agentpp/Config.in b/package/agentpp/Config.in
index e591fb5f3cc4..8c6b11d644e4 100644
--- a/package/agentpp/Config.in
+++ b/package/agentpp/Config.in
@@ -5,13 +5,14 @@ config BR2_PACKAGE_AGENTPP
 	depends on !BR2_STATIC_LIBS # snmp++
 	select BR2_PACKAGE_SNMPPP
 	help
-	  AGENT++ is a set of C++ classes which provides a complete protocol
-	  engine and dispatch table for the development of SNMP agents.
-	  AGENT++ is a multilingual API which supports SNMPv1, SNMPv2c, and
-	  SNMPv3. It provides various C++ classes implementing prototypes for
-	  scalar and table SNMP managed objects that can be customized by
-	  derivation. Additional classes support the development of proxy
-	  agents as well as sending notifications.
+	  AGENT++ is a set of C++ classes which provides a complete
+	  protocol engine and dispatch table for the development of
+	  SNMP agents. AGENT++ is a multilingual API which supports
+	  SNMPv1, SNMPv2c, and SNMPv3. It provides various C++ classes
+	  implementing prototypes for scalar and table SNMP managed
+	  objects that can be customized by derivation. Additional
+	  classes support the development of proxy agents as well as
+	  sending notifications.
 
 	  SNMPv3 support is enabled if SNMP++ enables it.
 
-- 
2.7.4
