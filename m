From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:00 +0200
Subject: [Buildroot] [PATCH 46/63] xproto_printproto: version bump to 1.0.5
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-47-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../x11r7/xproto_printproto/xproto_printproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_printproto/xproto_printproto.mk b/package/x11r7/xproto_printproto/xproto_printproto.mk
index c06c5c3..04f8c0d 100644
--- a/package/x11r7/xproto_printproto/xproto_printproto.mk
+++ b/package/x11r7/xproto_printproto/xproto_printproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_PRINTPROTO_VERSION = 1.0.3
+XPROTO_PRINTPROTO_VERSION = 1.0.5
 XPROTO_PRINTPROTO_SOURCE = printproto-$(XPROTO_PRINTPROTO_VERSION).tar.bz2
 XPROTO_PRINTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_PRINTPROTO_AUTORECONF = NO
-- 
1.7.3.4
