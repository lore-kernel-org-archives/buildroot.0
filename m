From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Mar 2012 09:29:18 +0100
Subject: [Buildroot] [git commit] dhcp: fix download URL
Message-ID: <20120315082939.D42DE90DAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=afc69d8f5a139aedec23b12cf04d59986d500634
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tarball is in a subdir.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
