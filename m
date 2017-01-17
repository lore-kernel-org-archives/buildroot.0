From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jan 2017 14:54:44 +0100
Subject: [Buildroot] [git commit] snmppp: bump version to 3.3.9
Message-ID: <20170117135720.ABFE981DDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=744acd1984baef9b25cc9d54c5a4850ff9e0d44f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snmppp/snmppp.hash | 2 +-
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 2c97a48..75ecdda 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 982b5f03436813b3094ace49ba5ececc595f9b6db1ad90bd8bf8494e39aa438f  snmp++-3.3.8.tar.gz
+sha256 2ef0cb20658c1eb9e053f8a7a9d5c8f5ebf2f734d37b692fdbf7163ea17dde6f  snmp++-3.3.9.tar.gz
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 1419514..67410d9 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.8
+SNMPPP_VERSION = 3.3.9
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
