From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Sep 2016 23:05:33 +0200
Subject: [Buildroot] [git commit] snmppp: bump to 3.3.7
Message-ID: <20160902210543.680D281F75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffba4aec9c28cb86448e0ce142af4b6c6d93ca6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
