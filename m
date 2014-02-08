From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 23:03:46 +0100
Subject: [Buildroot] [git commit] snmppp: bump to version 3.3.3
Message-ID: <20140208222132.2B7109C849@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6232dbbe377aef87611ddea565964cbec2dacd9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes snmp++v3.3.3

====================

- Fixed: [APP-30] SNMP++ cannot BER decode Oids starting with 2 and
  with second sub-identifier >39 correctly.
- Fixed: [APP-31] SNMP++ does not encode Oids starting with 2 and
  second sub-ID greater than 47 correctly.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snmppp/snmppp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index eb1b7b9..2cae093 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.2
+SNMPPP_VERSION = 3.3.3
 SNMPPP_SOURCE = snmp++$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com
 SNMPPP_DEPENDENCIES = openssl host-pkgconf
