From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 14:11:13 +0200
Subject: [Buildroot] [git commit] dhcp: security bump to version 4.1-ESV-R7
Message-ID: <20120920124824.915A79964E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d070d1f7ba6449d87444512a5cca5f8582ea1f4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump dhcp to version 4.1-ESV-R7 to fix CVE-2012-3955

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
