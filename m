From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Mar 2012 17:44:15 +0200
Subject: [Buildroot] [git commit] tftp-hpa: bump to version 5.2
Message-ID: <20120329154644.90F79969A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=180c7126dfe19ba7c22ae414d4d99501152f13ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tftpd/tftpd.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 728319b..80f2935 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -3,9 +3,10 @@
 # tftpd
 #
 #############################################################
-TFTPD_VERSION  = 5.0
+
+TFTPD_VERSION  = 5.2
 TFTPD_SOURCE   = tftp-hpa-$(TFTPD_VERSION).tar.bz2
-TFTPD_SITE     = $(BR2_KERNEL_MIRROR)/software/network/tftp/
+TFTPD_SITE     = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
 TFTPD_CONF_OPT = --without-tcpwrappers
 
 ifneq ($(BR2_INET_IPV6),y)
