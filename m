From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 13:32:42 +0100
Subject: [Buildroot] [git commit] vlc: needs host-pkgconf
Message-ID: <20140113211744.600AA9C49F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3c88d8fcd76fc90dd54430be545b743c610b28a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script uses PKG_CHECK_MODULES to detect dependencies.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 606be0e..d144608 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -9,6 +9,7 @@ VLC_SITE = http://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
+VLC_DEPENDENCIES = host-pkgconf
 
 VLC_CONF_OPT += \
 	--disable-a52 \
