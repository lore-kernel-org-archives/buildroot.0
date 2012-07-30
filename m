From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:22:36 +0200
Subject: [Buildroot] [git commit] dhcp: security bump to version 4.1-ESV-R6
Message-ID: <20120730172259.F1C9496FB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2a4bf429b9bdaf00675b10d6a8a808ae688471a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2012-3571 and CVE-2012-3954.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/dhcp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 22b068a..e5c9968 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DHCP_VERSION  = 4.1-ESV-R4
+DHCP_VERSION  = 4.1-ESV-R6
 DHCP_SITE     = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_CONF_ENV = ac_cv_file__dev_random=yes
 DHCP_CONF_OPT = \
