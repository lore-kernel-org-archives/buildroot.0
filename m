From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 23:31:03 +0100
Subject: [Buildroot] [git commit] dhcp: add license information
Message-ID: <20130128223359.330A09A86B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30a29c848b040a0ad2c6f8f4cb156445292cbbbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dhcp/dhcp.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
