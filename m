From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 10:35:48 -0300
Subject: [Buildroot] [PATCH 3/8] dhcp: add license information
In-Reply-To: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358861753-5990-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcp/dhcp.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index c9d0b41..8d90ea4 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-DHCP_VERSION  = 4.1-ESV-R7
-DHCP_SITE     = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
+DHCP_VERSION = 4.1-ESV-R7
+DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
+DHCP_LICENSE = ISC
+DHCP_LICENSE_FILES = LICENSE
 DHCP_CONF_ENV = ac_cv_file__dev_random=yes
 DHCP_CONF_OPT = \
 	--localstatedir=/var/lib/dhcp \
-- 
1.7.12.4
