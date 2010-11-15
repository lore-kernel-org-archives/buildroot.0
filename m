From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Mon, 15 Nov 2010 09:58:04 +0100
Subject: [Buildroot] [PATCH 4/4] libglib2: bump to 2.26.1
In-Reply-To: <1289811484-30702-1-git-send-email-llandwerlin@gmail.com>
References: <1289811484-30702-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1289811484-30702-5-git-send-email-llandwerlin@gmail.com>
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
index 0d44d71..3f24d6d 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LIBGLIB2_VERSION_MAJOR = 2.26
-LIBGLIB2_VERSION_MINOR = 0
+LIBGLIB2_VERSION_MINOR = 1
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
1.7.2.3
