From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:46 -0300
Subject: [Buildroot] [PATCH 18/53] gtk2-engines: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-18-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gtk2-engines/gtk2-engines.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index 8d3193e..36034c3 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -6,10 +6,11 @@
 
 GTK2_ENGINES_VERSION_MAJOR = 2.20
 GTK2_ENGINES_VERSION = $(GTK2_ENGINES_VERSION_MAJOR).2
-GTK2_ENGINES_SOURCE  = gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
-GTK2_ENGINES_SITE    = http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/$(GTK2_ENGINES_VERSION_MAJOR)
-
+GTK2_ENGINES_SOURCE = gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
+GTK2_ENGINES_SITE = http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/$(GTK2_ENGINES_VERSION_MAJOR)
 GTK2_ENGINES_DEPENDENCIES = libgtk2 host-intltool
+GTK2_ENGINES_LICENSE = LGPLv2.1+
+GTK2_ENGINES_LICENSE_FILES = COPYING
 
 GTK2_ENGINES_CONF_ENV = \
 		ac_cv_func_posix_getpwuid_r=yes \
-- 
1.8.5.5
