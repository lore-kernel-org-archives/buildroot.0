From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 18:22:42 +0200
Subject: [Buildroot] [git commit] libgtk2: change download site
Message-ID: <20110518180431.6742E83564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e3d389d6d609c60afa31f179bdf8e04901d95ae6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the Gnome FTP server as the download site, like we do for other
components of the Gtk stack.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 98b27ae..3586c86 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -8,7 +8,7 @@ LIBGTK2_VERSION_MINOR:=4
 LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).$(LIBGTK2_VERSION_MINOR)
 
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.bz2
-LIBGTK2_SITE = ftp://ftp.gtk.org/pub/gtk/$(LIBGTK2_VERSION_MAJOR)
+LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_AUTORECONF = NO
 LIBGTK2_INSTALL_STAGING = YES
 LIBGTK2_INSTALL_TARGET = YES
-- 
1.7.3.4
