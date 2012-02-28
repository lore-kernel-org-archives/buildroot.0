From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Feb 2012 17:30:03 -0300
Subject: [Buildroot] [PATCH] dhcp: security bump to version 4.1-ESV-R4
Message-ID: <1330461003-1989-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 4.1-ESV-R4 to fix CVE-2011-4539

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcp/dhcp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 7548f41..10bdc2e 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DHCP_VERSION  = 4.1-ESV-R3
+DHCP_VERSION  = 4.1-ESV-R4
 DHCP_SITE     = http://ftp.isc.org/isc/dhcp
 DHCP_CONF_ENV = ac_cv_file__dev_random=yes
 DHCP_CONF_OPT = \
-- 
1.7.3.4
