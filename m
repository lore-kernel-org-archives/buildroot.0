From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Feb 2013 16:29:51 -0300
Subject: [Buildroot] [PATCH 2/2] dhcp: bump to version 4.1-ESV-R8
In-Reply-To: <1360092591-14958-1-git-send-email-gustavo@zacarias.com.ar>
References: <1360092591-14958-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1360092591-14958-2-git-send-email-gustavo@zacarias.com.ar>
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
index 8d90ea4..34c0afa 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DHCP_VERSION = 4.1-ESV-R7
+DHCP_VERSION = 4.1-ESV-R8
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_LICENSE = ISC
 DHCP_LICENSE_FILES = LICENSE
-- 
1.7.12.4
