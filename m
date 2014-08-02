From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Aug 2014 18:26:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Bump version to 2.1.5
Message-ID: <1406996762-6980-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 6c4677a..ad9f485 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.1.4
+VLC_VERSION = 2.1.5
 VLC_SITE = http://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
-- 
1.7.10.4
