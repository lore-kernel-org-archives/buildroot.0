From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  6 Nov 2012 09:07:53 +0100
Subject: [Buildroot] [PATCH 2/3] xapp_mkfontdir: bump to 1.0.7
In-Reply-To: <1352189274-7000-1-git-send-email-yegorslists@googlemail.com>
References: <1352189274-7000-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1352189274-7000-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index fa4e990..e32ed85 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_MKFONTDIR_VERSION = 1.0.6
+XAPP_MKFONTDIR_VERSION = 1.0.7
 XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
 XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
-- 
1.7.7
