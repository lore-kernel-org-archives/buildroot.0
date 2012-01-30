From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 30 Jan 2012 15:46:24 +0100
Subject: [Buildroot] [PATCH 2/3] xapp_xinput: bump to 1.5.4
In-Reply-To: <1327934785-3957-1-git-send-email-yegorslists@googlemail.com>
References: <1327934785-3957-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1327934785-3957-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/xapp_xinput/xapp_xinput.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 4e6884d..4bc5879 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINPUT_VERSION = 1.5.0
+XAPP_XINPUT_VERSION = 1.5.4
 XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi
-- 
1.7.1.1
