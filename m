From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 23:28:09 +0100
Subject: [Buildroot] [git commit] xorg: Bump xkeyboard-config version to
	2.10.1
Message-ID: <20140105230943.074AC9C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed7621c536a69f692d7564bbcc299d6b189b5c55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop uneeded extra dependencies]
Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 49540df..05224a7 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.6
+XKEYBOARD_CONFIG_VERSION = 2.10.1
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
 XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp
-XKEYBOARD_CONFIG_CONF_OPT += --disable-runtime-deps
 
 $(eval $(autotools-package))
