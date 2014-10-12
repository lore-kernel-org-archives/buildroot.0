From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 17:49:17 +0200
Subject: [Buildroot] [git commit] package/vlc: Fix typo
Message-ID: <20141012154954.4B7BBB2611@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f89d90d605d5cf3b683258611d78c8cc4e9f531b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
