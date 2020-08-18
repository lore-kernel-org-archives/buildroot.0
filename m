From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:29:31 +0200
Subject: [Buildroot] [git commit branch/next] package/snmppp: bump to
 version 3.4.2
Message-ID: <20200818212333.886DB81D31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb13451d5cba272cf121cb06cc58ec951a47b9b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The src/v3.cpp source file, used as a license file, has seen a few
modifications (hence the change of hash) but none of these changes are
related to licensing.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snmppp/snmppp.hash | 4 ++--
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 320581fb91..2dcf836fc7 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ea7b676e48c7a53c380c406bc6163b7057df74a6a1bf9f3cc1f13ba246225907  snmp++-3.4.1.tar.gz
-sha256  bf7bcfe654a7b4f30374035016e563d0f654af2c8306692ebcc53c3d7e655420  src/v3.cpp
+sha256  a3eb75e2310c315d9b2c2094154c7cd9b46684adb80a4b36b8957dcc09af4041  snmp++-3.4.2.tar.gz
+sha256  f6fd4321c7eb6e51a272f91f964aea7f53039bb2b55f690d5a9d042f3a5d79b9  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 270c41fc4b..601e28e207 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.4.1
+SNMPPP_VERSION = 3.4.2
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
