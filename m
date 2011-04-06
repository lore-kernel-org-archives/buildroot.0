From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:59 +0200
Subject: [Buildroot] [PATCH 45/63] xproto_randrproto: version bump to 1.3.2
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-46-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../x11r7/xproto_randrproto/xproto_randrproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index e6befea..ff06541 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RANDRPROTO_VERSION = 1.3.1
+XPROTO_RANDRPROTO_VERSION = 1.3.2
 XPROTO_RANDRPROTO_SOURCE = randrproto-$(XPROTO_RANDRPROTO_VERSION).tar.bz2
 XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RANDRPROTO_AUTORECONF = NO
-- 
1.7.3.4
