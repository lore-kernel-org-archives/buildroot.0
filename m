From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:05 +0200
Subject: [Buildroot] [PATCH 51/63] xproto_fixesproto: version bump to 5.0
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-52-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index 1395e0c..ba4be83 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_FIXESPROTO_VERSION = 4.1.1
+XPROTO_FIXESPROTO_VERSION = 5.0
 XPROTO_FIXESPROTO_SOURCE = fixesproto-$(XPROTO_FIXESPROTO_VERSION).tar.bz2
 XPROTO_FIXESPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FIXESPROTO_AUTORECONF = NO
-- 
1.7.3.4
