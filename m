From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  8 Jul 2018 02:16:57 -0300
Subject: [Buildroot] [PATCH 1/5] gconf: use $() to reference make variables
 instead of ${}
Message-ID: <20180708051701.3153-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
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
-- 
2.17.1
