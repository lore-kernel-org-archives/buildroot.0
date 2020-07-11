From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 00:10:07 +0200
Subject: [Buildroot] [git commit] package/snmppp: bump version to 3.4.1
Message-ID: <20200711220657.A078084E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fc84ef9e17e27c3d1d2634653d92e526e8e3459
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snmppp/snmppp.hash | 4 ++--
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index bc54d8c6ba..320581fb91 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 06a2af44b2976b61667756e3f74604820fce0ef8bfc7f31280308f1eeb7633f3	snmp++-3.3.11a.tar.gz
-sha256 5538f9efc2559a35025df5d6bf19dc85c2bfe54dca6e8409d5690d4f7c69166a	src/v3.cpp
+sha256  ea7b676e48c7a53c380c406bc6163b7057df74a6a1bf9f3cc1f13ba246225907  snmp++-3.4.1.tar.gz
+sha256  bf7bcfe654a7b4f30374035016e563d0f654af2c8306692ebcc53c3d7e655420  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 0e862faa48..8090a03818 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.11a
+SNMPPP_VERSION = 3.4.1
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
