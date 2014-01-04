From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 4 Jan 2014 14:38:59 +0100
Subject: [Buildroot] [PATCH 30/36] xorg: Bump xproto_randrproto version to
	1.4.0
In-Reply-To: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP4627A400E2929F5F61AAD58D9B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../x11r7/xproto_randrproto/xproto_randrproto.mk   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index b12653e..a8fb232 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RANDRPROTO_VERSION = 1.3.2
+XPROTO_RANDRPROTO_VERSION = 1.4.0
 XPROTO_RANDRPROTO_SOURCE = randrproto-$(XPROTO_RANDRPROTO_VERSION).tar.bz2
 XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RANDRPROTO_LICENSE = MIT
-- 
1.7.9.5
