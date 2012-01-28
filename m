From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 28 Jan 2012 23:01:05 +0100
Subject: [Buildroot] [git commit] vala: bump version
Message-ID: <20120128232349.29D729091F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d2df61ebd0ee06b5c7cec6fc9c06286dbf85eae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tarball is only available as .xz

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vala/vala.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 0a1aed0..52a8510 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-VALA_VERSION = 0.14.0
-VALA_SITE = http://download.gnome.org/sources/vala/0.14
-VALA_SOURCE = vala-$(VALA_VERSION).tar.bz2
+VALA_VERSION_MAJOR = 0.15
+VALA_VERSION_MINOR = 1
+VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
+VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
+VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_DEPENDENCIES = host-flex libglib2 \
 		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 HOST_VALA_DEPENDENCIES = host-flex host-libglib2
