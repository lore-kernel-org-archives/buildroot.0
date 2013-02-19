From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Feb 2013 16:11:33 +0100
Subject: [Buildroot] [git commit] glib-networking: fix a typo in the .mk file
Message-ID: <20130219151452.0C8C59ABA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6bec692f9790021e937f612f71ea90ae42512659
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The variable GLIB_NETWORKING_MINOR_VERSION had a typo.

Signed-off-by: Henrique Camargo <henrique@henriquecamargo.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/glib-networking/glib-networking.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index e8d71e5..4812fd6 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -5,8 +5,8 @@
 #############################################################
 
 GLIB_NETWORKING_MAJOR_VERSION = 2.30
-GLIB_NETWORLING_MINOR_VERSION = 2
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_MAJOR_VERSION).$(GLIB_NETWORLING_MINOR_VERSION)
+GLIB_NETWORKING_MINOR_VERSION = 2
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_MAJOR_VERSION).$(GLIB_NETWORKING_MINOR_VERSION)
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_MAJOR_VERSION)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 
