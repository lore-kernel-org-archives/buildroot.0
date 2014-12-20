From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Dec 2014 10:34:32 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/vlc: Update SITE url
In-Reply-To: <1419068072-7779-1-git-send-email-bernd.kuhls@t-online.de>
References: <1419068072-7779-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1419068072-7779-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

old SITE is now password-protected

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added patch description (Peter)

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
