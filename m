From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 17 Jun 2015 14:00:29 +0200
Subject: [Buildroot] [PATCH 1/2] snmppp: bump to 3.3.5
Message-ID: <1434542430-23039-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a hash file.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/snmppp/snmppp.hash | 2 ++
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/snmppp/snmppp.hash

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
new file mode 100644
index 0000000..a278ebf
--- /dev/null
+++ b/package/snmppp/snmppp.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 65d8bef3fb0e28892b7768e4027c2873b5556fc89c5440008508bf8ec91764cd snmp++-3.3.5.tar.gz
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 147af60..29b1d99 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.4
+SNMPPP_VERSION = 3.3.5
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
-- 
1.9.1
