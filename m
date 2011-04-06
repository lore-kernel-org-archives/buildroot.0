From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:56 +0200
Subject: [Buildroot] [PATCH 42/63] xproto_scrnsaverproto: version bump to
	1.2.1
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-43-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
index f7f53e6..6635624 100644
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_SCRNSAVERPROTO_VERSION = 1.2.0
+XPROTO_SCRNSAVERPROTO_VERSION = 1.2.1
 XPROTO_SCRNSAVERPROTO_SOURCE = scrnsaverproto-$(XPROTO_SCRNSAVERPROTO_VERSION).tar.bz2
 XPROTO_SCRNSAVERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_SCRNSAVERPROTO_AUTORECONF = NO
-- 
1.7.3.4
