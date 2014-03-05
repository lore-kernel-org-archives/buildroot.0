From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Mar 2014 19:39:57 +0100
Subject: [Buildroot] [git commit] snmppp: bump to version 3.3.4
Message-ID: <20140305184004.5C5949BD70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4de56815cd09c44b1c173f70f45cdb27b3f7307
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes snmp++v3.3.4:
- Fixed: Incorrect time values conversion in += and -= operators of the
  msec class in msec.cpp.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/snmppp/snmppp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 2cae093..e4615d8 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.3
+SNMPPP_VERSION = 3.3.4
 SNMPPP_SOURCE = snmp++$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com
 SNMPPP_DEPENDENCIES = openssl host-pkgconf
