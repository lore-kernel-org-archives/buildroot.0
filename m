From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:19:24 +0200
Subject: [Buildroot] [git commit] feh: add license information
Message-ID: <20140701224921.8139F9CFFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e1529aa2e47e8b179c8492c726e0a73b9446ebd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/feh/feh.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index e63f89e..681fdc4 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -8,6 +8,8 @@ FEH_VERSION = 2.12
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org/
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
+FEH_LICENSE = MIT
+FEH_LICENSE_FILES = COPYING
 
 define FEH_BUILD_CMDS
 	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
