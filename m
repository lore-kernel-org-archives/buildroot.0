From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 21 Jul 2009 16:30:32 +0200
Subject: [Buildroot] [PATCH] libglib2: update to upstream release 2.20.4
Message-ID: <1248186632-32201-1-git-send-email-s.neumann@raumfeld.com>
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
index 75f0cfc..b2738b0 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LIBGLIB2_VERSION_MAJOR = 2.20
-LIBGLIB2_VERSION_MINOR = 1
+LIBGLIB2_VERSION_MINOR = 4
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
1.6.0.4
