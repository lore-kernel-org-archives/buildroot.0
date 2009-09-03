From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu,  3 Sep 2009 21:06:22 +0200
Subject: [Buildroot] [PATCH] libglib2: bump version to 2.20.5
Message-ID: <1252004782-21800-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/libglib2/libglib2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index b2738b0..fcc5a93 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LIBGLIB2_VERSION_MAJOR = 2.20
-LIBGLIB2_VERSION_MINOR = 4
+LIBGLIB2_VERSION_MINOR = 5
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
1.6.3.3
