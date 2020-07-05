From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun,  5 Jul 2020 13:52:41 -0300
Subject: [Buildroot] [PATCH 1/2] package/snmppp: bump version to 3.4.1
In-Reply-To: <20200705165242.13930-1-sergio.prado@e-labworks.com>
References: <20200705165242.13930-1-sergio.prado@e-labworks.com>
Message-ID: <20200705165242.13930-2-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/snmppp/snmppp.hash | 4 ++--
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index bc54d8c6ba24..320581fb91e2 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 06a2af44b2976b61667756e3f74604820fce0ef8bfc7f31280308f1eeb7633f3	snmp++-3.3.11a.tar.gz
-sha256 5538f9efc2559a35025df5d6bf19dc85c2bfe54dca6e8409d5690d4f7c69166a	src/v3.cpp
+sha256  ea7b676e48c7a53c380c406bc6163b7057df74a6a1bf9f3cc1f13ba246225907  snmp++-3.4.1.tar.gz
+sha256  bf7bcfe654a7b4f30374035016e563d0f654af2c8306692ebcc53c3d7e655420  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 0e862faa4854..8090a03818eb 100644
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
-- 
2.17.1
