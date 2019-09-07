From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 21:54:37 +0200
Subject: [Buildroot] [git commit] package/snmppp: bump to version 3.3.11a
Message-ID: <20190907195127.ABD728CA13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dcbaa6d406ccf3951ffc9a660b645403a89b8eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file (source file has been updated)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snmppp/snmppp.hash | 4 ++--
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 5c8feee152..bc54d8c6ba 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 6827adb6a6a68a7f32c41fa12bdfd0aa48f4825b8773f63fc4d5c8482d4ed481	snmp++-3.3.10.tar.gz
-sha256 d00d5deb9ce44fa01ddf6f882de3ea8b9e8402f776b546dd982d55367ebbd392	src/v3.cpp
+sha256 06a2af44b2976b61667756e3f74604820fce0ef8bfc7f31280308f1eeb7633f3	snmp++-3.3.11a.tar.gz
+sha256 5538f9efc2559a35025df5d6bf19dc85c2bfe54dca6e8409d5690d4f7c69166a	src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 4ceb61c9fc..0e862faa48 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.10
+SNMPPP_VERSION = 3.3.11a
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
