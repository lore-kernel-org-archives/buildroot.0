From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Sep 2014 17:50:37 -0300
Subject: [Buildroot] [PATCH 2/7] dhcp: bump to version 4.1-ESV-R10
In-Reply-To: <1409863842-24226-1-git-send-email-gustavo@zacarias.com.ar>
References: <1409863842-24226-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1409863842-24226-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcp/dhcp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 464ed56..9251185 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.1-ESV-R9
+DHCP_VERSION = 4.1-ESV-R10
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
-- 
1.8.5.5
