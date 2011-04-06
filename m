From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:08 +0200
Subject: [Buildroot] [PATCH 54/63] xproto_compositeproto: version bump to
	0.4.2
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-55-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../xproto_compositeproto/xproto_compositeproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
index b176b69..4579dd4 100644
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_COMPOSITEPROTO_VERSION = 0.4.1
+XPROTO_COMPOSITEPROTO_VERSION = 0.4.2
 XPROTO_COMPOSITEPROTO_SOURCE = compositeproto-$(XPROTO_COMPOSITEPROTO_VERSION).tar.bz2
 XPROTO_COMPOSITEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_COMPOSITEPROTO_AUTORECONF = NO
-- 
1.7.3.4
