From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Sep 2012 20:35:26 +0200
Subject: [Buildroot] [git commit] libglib2: bump version
Message-ID: <20120925195200.C86C9996CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=919dca5e9296f1c109f2dbd513b49365c012851e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details, see:

http://ftp.gnome.org/pub/gnome/sources/glib/2.30/glib-2.30.3.news

Notice: 2.30.3 is only available in .xz format.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libglib2/libglib2.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 030cecb..dcd7996 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,13 +4,12 @@
 #
 #############################################################
 LIBGLIB2_VERSION_MAJOR = 2.30
-LIBGLIB2_VERSION_MINOR = 2
+LIBGLIB2_VERSION_MINOR = 3
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
-LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
+LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 
 LIBGLIB2_INSTALL_STAGING = YES
-LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 LIBGLIB2_CONF_ENV = \
