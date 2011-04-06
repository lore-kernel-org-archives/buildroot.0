From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:50 +0200
Subject: [Buildroot] [PATCH 36/63] xproto_xineramaproto: version bumpt to
	1.2.1
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-37-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../xproto_xineramaproto/xproto_xineramaproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
index bca3c8f..a73e5ec 100644
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XINERAMAPROTO_VERSION = 1.2
+XPROTO_XINERAMAPROTO_VERSION = 1.2.1
 XPROTO_XINERAMAPROTO_SOURCE = xineramaproto-$(XPROTO_XINERAMAPROTO_VERSION).tar.bz2
 XPROTO_XINERAMAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XINERAMAPROTO_AUTORECONF = NO
-- 
1.7.3.4
