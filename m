From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 18 Jul 2012 23:17:36 +0200
Subject: [Buildroot] [PATCH 1/5] libglib2: bump to version 2.32.4
In-Reply-To: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
References: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1342646260-11203-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/libglib2/libglib2.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 2b2bd32..976caf0 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -3,10 +3,10 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.30
-LIBGLIB2_VERSION_MINOR = 2
+LIBGLIB2_VERSION_MAJOR = 2.32
+LIBGLIB2_VERSION_MINOR = 4
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
-LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
+LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 
 LIBGLIB2_INSTALL_STAGING = YES
-- 
1.7.9.5
