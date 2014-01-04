From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 4 Jan 2014 14:39:01 +0100
Subject: [Buildroot] [PATCH 32/36] xorg: Bump xproto_xextproto version to
	7.3.0
In-Reply-To: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP4559F433826FC78BE76B1AFD9B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index b78ba4a..700580b 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XEXTPROTO_VERSION = 7.2.1
+XPROTO_XEXTPROTO_VERSION = 7.3.0
 XPROTO_XEXTPROTO_SOURCE = xextproto-$(XPROTO_XEXTPROTO_VERSION).tar.bz2
 XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XEXTPROTO_LICENSE = MIT
-- 
1.7.9.5
