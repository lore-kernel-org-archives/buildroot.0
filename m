From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 23:01:14 +0100
Subject: [Buildroot] [git commit] dhcp: security bump to version 4.1-ESV-R4
Message-ID: <20120311220227.C9EF190D46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51dc5df8ab124f91695f87ea9e3971c0a5a0c421
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 4.1-ESV-R4 to fix CVE-2011-4539

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
