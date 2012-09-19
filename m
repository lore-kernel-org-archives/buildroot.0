From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 19 Sep 2012 13:23:57 -0300
Subject: [Buildroot] [PATCH] dhcp: security bump to version 4.1-ESV-R7
Message-ID: <1348071837-496-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump dhcp to version 4.1-ESV-R7 to fix CVE-2012-3955

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcp/dhcp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index e5c9968..c9d0b41 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DHCP_VERSION  = 4.1-ESV-R6
+DHCP_VERSION  = 4.1-ESV-R7
 DHCP_SITE     = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_CONF_ENV = ac_cv_file__dev_random=yes
 DHCP_CONF_OPT = \
-- 
1.7.8.6
