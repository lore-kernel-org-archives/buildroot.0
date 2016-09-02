From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  2 Sep 2016 14:22:51 +0200
Subject: [Buildroot] [PATCH 1/2] snmppp: bump to 3.3.7
Message-ID: <1472818972-18866-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/snmppp/snmppp.hash | 2 +-
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index a278ebf..462f413 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 65d8bef3fb0e28892b7768e4027c2873b5556fc89c5440008508bf8ec91764cd snmp++-3.3.5.tar.gz
+sha256 2ef82819f2c4e9fec4c054a3e78a6d66f9927e306ea61d3a7aa6fe1218663da8  snmp++-3.3.7.tar.gz
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 026fe6e..69ec925 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.5
+SNMPPP_VERSION = 3.3.7
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
-- 
2.7.4
