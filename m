From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Oct 2011 23:25:28 +0200
Subject: [Buildroot] [git commit] vala: bump to version 0.14.0
Message-ID: <20111018052250.E9FEA8E9B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d3f11d2bb1c56f02f606158229e6109cf55360d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vala/vala.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index b1217cb..0a1aed0 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-VALA_VERSION = 0.12.1
-VALA_SITE = http://download.gnome.org/sources/vala/0.12
+VALA_VERSION = 0.14.0
+VALA_SITE = http://download.gnome.org/sources/vala/0.14
 VALA_SOURCE = vala-$(VALA_VERSION).tar.bz2
 VALA_DEPENDENCIES = host-flex libglib2 \
 		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
