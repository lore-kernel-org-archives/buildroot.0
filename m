From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:02 +0200
Subject: [Buildroot] [PATCH 48/63] xproto_inputproto: version bump to 2.0.1
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-49-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index 825ebed..d560c23 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_INPUTPROTO_VERSION = 2.0
+XPROTO_INPUTPROTO_VERSION = 2.0.1
 XPROTO_INPUTPROTO_SOURCE = inputproto-$(XPROTO_INPUTPROTO_VERSION).tar.bz2
 XPROTO_INPUTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_INPUTPROTO_AUTORECONF = NO
-- 
1.7.3.4
