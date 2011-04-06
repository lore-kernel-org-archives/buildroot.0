From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:07 +0200
Subject: [Buildroot] [PATCH 53/63] xproto_damageproto: version bump to 1.2.1
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-54-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../x11r7/xproto_damageproto/xproto_damageproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
index a2f8c71..b1a77a7 100644
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_DAMAGEPROTO_VERSION = 1.2.0
+XPROTO_DAMAGEPROTO_VERSION = 1.2.1
 XPROTO_DAMAGEPROTO_SOURCE = damageproto-$(XPROTO_DAMAGEPROTO_VERSION).tar.bz2
 XPROTO_DAMAGEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DAMAGEPROTO_AUTORECONF = NO
-- 
1.7.3.4
