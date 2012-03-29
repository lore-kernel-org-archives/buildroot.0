From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Mar 2012 23:25:00 -0300
Subject: [Buildroot] [PATCH 4/7] tftp-hpa: bump to version 5.2
In-Reply-To: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1332987903-12378-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
