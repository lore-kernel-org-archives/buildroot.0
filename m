From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:09 +0200
Subject: [Buildroot] [PATCH 55/63] xproto_bigreqsproto: version bump to 1.1.1
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-56-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
index 7ae7795..9d0a132 100644
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_BIGREQSPROTO_VERSION = 1.1.0
+XPROTO_BIGREQSPROTO_VERSION = 1.1.1
 XPROTO_BIGREQSPROTO_SOURCE = bigreqsproto-$(XPROTO_BIGREQSPROTO_VERSION).tar.bz2
 XPROTO_BIGREQSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_BIGREQSPROTO_AUTORECONF = NO
-- 
1.7.3.4
