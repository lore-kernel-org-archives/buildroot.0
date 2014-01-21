From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 07:29:09 +0100
Subject: [Buildroot] [git commit] vlc: correct sdl_image dependency name
Message-ID: <20140121063005.B4C099C517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67e4407b9f647462f511fd4c1979abbf8332230e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/7e8/7e85b79612a46df2eee0278703f54d872da72ed5/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ec5727d..458fe1c 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -214,7 +214,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SDL_IMAGE),y)
 VLC_CONF_OPT += --enable-sdl-image
-VLC_DEPENDENCIES += sdl-image
+VLC_DEPENDENCIES += sdl_image
 else
 VLC_CONF_OPT += --disable-sdl-image
 endif
