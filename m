From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:54:24 +0200
Subject: [Buildroot] [git commit] librsvg: add license information
Message-ID: <20140625211213.EE1929D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f8f4fc990c118978fc31a476f038a7cf2cad0b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librsvg/librsvg.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 9385fe9..86dce41 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -10,6 +10,8 @@ LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPT = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 gdk-pixbuf
+LIBRSVG_LICENSE = LGPLv2+
+LIBRSVG_LICENSE_FILES = COPYING.LIB
 
 # If we have Gtk2, let's build it first to benefit from librsvg Gtk
 # support.
