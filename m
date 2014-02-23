From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 20:58:47 +0100
Subject: [Buildroot] [git commit] sdl: fix SDL_AUTORECONF typo in comment
Message-ID: <20140223195928.263339B92A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4b54ed184afb1a3e25b576e51a703abaa8ced56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl/sdl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index cf3366d..510acd9 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -12,7 +12,7 @@ SDL_LICENSE_FILES = COPYING
 SDL_INSTALL_STAGING = YES
 
 # we're patching configure.in, but package cannot autoreconf with our version of
-# autotools, so we have to do it manually instead of setting SD_AUTORECONF = YES
+# autotools, so we have to do it manually instead of setting SDL_AUTORECONF = YES
 define SDL_RUN_AUTOGEN
 	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
 endef
