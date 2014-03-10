From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 17:26:33 -0300
Subject: [Buildroot] [PATCH 13/14] xl2tp: bump to version 1.3.6
In-Reply-To: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394483194-17592-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xl2tp/xl2tp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index b61dac9..0b2f7f1 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XL2TP_VERSION = v1.3.2
+XL2TP_VERSION = v1.3.6
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap openssl
 XL2TP_LICENSE = GPLv2
-- 
1.8.3.2
