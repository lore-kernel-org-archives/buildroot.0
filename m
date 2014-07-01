From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:25:25 +0200
Subject: [Buildroot] [git commit] gtk2-engines: add license information
Message-ID: <20140701224921.AAF5F9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=248f08cc8c4926dcf15463517f0d8306dd4608b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtk2-engines/gtk2-engines.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

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
