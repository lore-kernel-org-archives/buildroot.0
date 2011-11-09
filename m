From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Nov 2011 15:53:09 +0100
Subject: [Buildroot] [git commit] dhcp: security bump to version 4.1-ESV-R3
Message-ID: <20111109224312.1BC048F44E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb3785fca4f07ef170feac3c60ce7926466d5457
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
