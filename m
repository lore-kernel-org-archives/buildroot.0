From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:03 +0200
Subject: [Buildroot] [PATCH 49/63] xproto_glproto: version bump to 1.4.12
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-50-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/x11r7/xproto_glproto/xproto_glproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
index 98c6b2f..d2ecd13 100644
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ b/package/x11r7/xproto_glproto/xproto_glproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_GLPROTO_VERSION = 1.4.10
+XPROTO_GLPROTO_VERSION = 1.4.12
 XPROTO_GLPROTO_SOURCE = glproto-$(XPROTO_GLPROTO_VERSION).tar.bz2
 XPROTO_GLPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_GLPROTO_AUTORECONF = NO
-- 
1.7.3.4
