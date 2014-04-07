From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Apr 2014 01:18:34 +0200
Subject: [Buildroot] [git commit] snmppp: update download URL
Message-ID: <20140407232955.C39139BE84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdf8dcd0cc4f74baee50b21f9c479ae27151ea6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The filename of the SNMP++ sources has changed.
The old one is still working because the server automatically redirects to the
new file, but it is safer to use the official name.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snmppp/snmppp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index e4615d8..78d7dc9 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SNMPPP_VERSION = 3.3.4
-SNMPPP_SOURCE = snmp++$(SNMPPP_VERSION).tar.gz
+SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com
 SNMPPP_DEPENDENCIES = openssl host-pkgconf
 SNMPPP_INSTALL_STAGING = YES
