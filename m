From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:12:16 +0200
Subject: [Buildroot] [git commit] gconf: use $() to reference make variables
 instead of ${}
Message-ID: <20180708101935.3D4BB863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffb69cc9c8bd2c7e7085ac8050b685a1f8c7ffe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gconf/gconf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
index 39df95fbd2..60ced95e18 100644
--- a/package/gconf/gconf.mk
+++ b/package/gconf/gconf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GCONF_VERSION = 3.2.6
-GCONF_SOURCE = GConf-${GCONF_VERSION}.tar.xz
+GCONF_SOURCE = GConf-$(GCONF_VERSION).tar.xz
 GCONF_SITE = http://ftp.gnome.org/pub/gnome/sources/GConf/3.2
 GCONF_CONF_OPTS = --disable-orbit
 GCONF_DEPENDENCIES = dbus dbus-glib libglib2 libxml2 \
