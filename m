From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Oct 2014 17:38:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Fix typo
Message-ID: <1413128292-14615-1-git-send-email-bernd.kuhls@t-online.de>
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
index 13c72ce..5a75087 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -50,7 +50,7 @@ VLC_CONF_OPTS += --disable-static
 endif
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-VCL_CONF_OPTS += --enable-altivec
+VLC_CONF_OPTS += --enable-altivec
 else
 VLC_CONF_OPTS += --disable-altivec
 endif
-- 
1.7.10.4
