From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 19 Dec 2014 19:30:13 +0100
Subject: [Buildroot] [PATCH 2/2] package/vlc: Update SITE url
In-Reply-To: <1419013813-2050-1-git-send-email-bernd.kuhls@t-online.de>
References: <1419013813-2050-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1419013813-2050-2-git-send-email-bernd.kuhls@t-online.de>
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
index 901f06d..9d99de6 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VLC_VERSION = 2.1.5
-VLC_SITE = http://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
+VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
-- 
1.7.10.4
