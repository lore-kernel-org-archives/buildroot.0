From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Nov 2011 08:30:59 -0300
Subject: [Buildroot] [PATCH] dhcp: security bump to version 4.1-ESV-R3
Message-ID: <1320838259-30988-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcp/dhcp.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index f520d77..7548f41 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -3,9 +3,9 @@
 # dhcp
 #
 #############################################################
-DHCP_VERSION  = 4.1.1-P1
-DHCP_SOURCE   = dhcp-$(DHCP_VERSION).tar.gz
-DHCP_SITE     = http://ftp.isc.org/isc/dhcp/
+
+DHCP_VERSION  = 4.1-ESV-R3
+DHCP_SITE     = http://ftp.isc.org/isc/dhcp
 DHCP_CONF_ENV = ac_cv_file__dev_random=yes
 DHCP_CONF_OPT = \
 	--localstatedir=/var/lib/dhcp \
-- 
1.7.3.4
