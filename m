From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:19:54 +0200
Subject: [Buildroot] [git commit] agentpp: fix help text format
Message-ID: <20170530212121.74185829FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c112fecb1860bb8597a418f208568673b87f68b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/agentpp/Config.in | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/agentpp/Config.in b/package/agentpp/Config.in
index e591fb5..8c6b11d 100644
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
 
