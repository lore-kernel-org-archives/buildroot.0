From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Jul 2014 15:53:21 +0200
Subject: [Buildroot] [PATCH 5/7] xproto_inputproto: Bump version to 2.3.1
In-Reply-To: <1405778003-2712-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405778003-2712-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405778003-2712-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xproto_inputproto/xproto_inputproto.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index 71715cd..a3a6065 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_INPUTPROTO_VERSION = 2.3
+XPROTO_INPUTPROTO_VERSION = 2.3.1
 XPROTO_INPUTPROTO_SOURCE = inputproto-$(XPROTO_INPUTPROTO_VERSION).tar.bz2
 XPROTO_INPUTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_INPUTPROTO_LICENSE = MIT
-- 
1.7.10.4
