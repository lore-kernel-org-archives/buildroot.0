From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 Apr 2014 00:20:03 +0200
Subject: [Buildroot] [PATCH 2/5] snmppp: update download URL
In-Reply-To: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
References: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1396822806-32655-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The filename of the SNMP++ sources has changed.
The old one is still working because the server automatically redirects to the
new file, but it is safer to use the official name.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/snmppp/snmppp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.3.2
