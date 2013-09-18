From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Sep 2013 08:33:30 -0300
Subject: [Buildroot] [PATCH] mplayer: security bump to version 1.1.1
Message-ID: <1379504010-32483-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mplayer/mplayer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index a13efed..9a511b4 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPLAYER_VERSION = 1.1
+MPLAYER_VERSION = 1.1.1
 MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
 MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
 
-- 
1.8.1.5
