From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 11:58:45 +0200
Subject: [Buildroot] [git commit] package/snmppp: Update site url
Message-ID: <20150521095909.C989D81DAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7f978c7c3ac764b7d11cee7523e1320b2579a86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/snmppp/snmppp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 74acee4..147af60 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -6,7 +6,7 @@
 
 SNMPPP_VERSION = 3.3.4
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
-SNMPPP_SITE = http://www.agentpp.com
+SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
 SNMPPP_INSTALL_STAGING = YES
 # no configure script in tarball
