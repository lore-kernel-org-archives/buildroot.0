From: Markus Kaindl <markus.kaindl@stusta.mhn.de>
Date: Thu, 15 Mar 2012 04:55:06 +0100
Subject: [Buildroot] [PATCH] Downloadsite DHCP changed
Message-ID: <1331783706-15520-1-git-send-email-markus.kaindl@stusta.mhn.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/dhcp/dhcp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 10bdc2e..9ec27d3 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 DHCP_VERSION  = 4.1-ESV-R4
-DHCP_SITE     = http://ftp.isc.org/isc/dhcp
+DHCP_SITE     = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_CONF_ENV = ac_cv_file__dev_random=yes
 DHCP_CONF_OPT = \
 	--localstatedir=/var/lib/dhcp \
-- 
1.7.3.4
