From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jan 2014 10:57:50 +0100
Subject: [Buildroot] [git commit] vlc: correct libtheora dependency name
Message-ID: <20140114095833.D03339C4C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=373d6f385e8a471a8bbe4fbe32cfd9bf64ae39ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/7b5/7b5387fa4e50036b7db407bf6ce866156bafcfdd/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index d144608..516876b 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -139,7 +139,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
 VLC_CONF_OPT += --enable-theora
-VLC_DEPENDENCIES += theora
+VLC_DEPENDENCIES += libtheora
 else
 VLC_CONF_OPT += --disable-theora
 endif
