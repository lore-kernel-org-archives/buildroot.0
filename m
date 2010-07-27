From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Tue, 27 Jul 2010 23:16:26 +0200
Subject: [Buildroot] [PATCH] libglib2: bump to 2.24.1
In-Reply-To: <1280265386-9491-1-git-send-email-llandwerlin@gmail.com>
References: <1280265386-9491-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1280265386-9491-2-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libglib2/libglib2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 622092d..6ddb820 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LIBGLIB2_VERSION_MAJOR = 2.24
-LIBGLIB2_VERSION_MINOR = 0
+LIBGLIB2_VERSION_MINOR = 1
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
1.7.1
