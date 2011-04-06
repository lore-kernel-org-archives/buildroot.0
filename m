From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:53 +0200
Subject: [Buildroot] [PATCH 39/63] xproto_xextproto: version bump to 7.2.0
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-40-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index 1fd39c9..2be3ac2 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XEXTPROTO_VERSION = 7.1.1
+XPROTO_XEXTPROTO_VERSION = 7.2.0
 XPROTO_XEXTPROTO_SOURCE = xextproto-$(XPROTO_XEXTPROTO_VERSION).tar.bz2
 XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XEXTPROTO_AUTORECONF = NO
-- 
1.7.3.4
