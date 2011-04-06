From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:06 +0200
Subject: [Buildroot] [PATCH 52/63] xproto_dmxproto: version bump to 2.3.1
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-53-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
index ff31e7e..d0f3f38 100644
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_DMXPROTO_VERSION = 2.3
+XPROTO_DMXPROTO_VERSION = 2.3.1
 XPROTO_DMXPROTO_SOURCE = dmxproto-$(XPROTO_DMXPROTO_VERSION).tar.bz2
 XPROTO_DMXPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DMXPROTO_AUTORECONF = NO
-- 
1.7.3.4
