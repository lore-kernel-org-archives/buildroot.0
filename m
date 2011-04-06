From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:57 +0200
Subject: [Buildroot] [PATCH 43/63] xproto_resourceproto: version bump to
	1.1.1
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-44-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../xproto_resourceproto/xproto_resourceproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
index c5e0d47..7b5f0ca 100644
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RESOURCEPROTO_VERSION = 1.1.0
+XPROTO_RESOURCEPROTO_VERSION = 1.1.1
 XPROTO_RESOURCEPROTO_SOURCE = resourceproto-$(XPROTO_RESOURCEPROTO_VERSION).tar.bz2
 XPROTO_RESOURCEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RESOURCEPROTO_AUTORECONF = NO
-- 
1.7.3.4
