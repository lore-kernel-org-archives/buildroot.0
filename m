From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Apr 2013 10:50:41 +0200
Subject: [Buildroot] [git commit] xkeyboard-config: fix license files typo
Message-ID: <20130430085128.E1142972B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92625d742e5eb0eae2094f7890b475aadff9d03e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed by Thomas.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index cdddd95..275ceef 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -8,7 +8,7 @@ XKEYBOARD_CONFIG_VERSION = 2.6
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
 XKEYBOARD_CONFIG_LICENSE = MIT
-XKEYBAORD_CONFIG_LICENSE_FILES = COPYING
+XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
 XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp
 XKEYBOARD_CONFIG_CONF_OPT += --disable-runtime-deps
