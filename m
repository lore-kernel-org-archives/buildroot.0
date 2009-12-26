From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 26 Dec 2009 17:00:41 +0100
Subject: [Buildroot] [PATCH] libglib2: bump to 2.22.3
In-Reply-To: <1259073157-19511-1-git-send-email-daniel@caiaq.de>
References: <1259073157-19511-1-git-send-email-daniel@caiaq.de>
Message-ID: <1261843241.5867.17.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libglib2/libglib2.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 04e3f2d..5f6ce05 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -3,8 +3,8 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.20
-LIBGLIB2_VERSION_MINOR = 5
+LIBGLIB2_VERSION_MAJOR = 2.22
+LIBGLIB2_VERSION_MINOR = 3
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
1.6.5.7
