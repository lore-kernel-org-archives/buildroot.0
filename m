From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:04:59 +0100
Subject: [Buildroot] [git commit] xl2tp: bump to version 1.3.6
Message-ID: <20140311220647.CA2D09BEED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5985cf9db298e77738303922d5321a6efb5fb91d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xl2tp/xl2tp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
