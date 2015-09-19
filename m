From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Sep 2015 12:34:37 +0200
Subject: [Buildroot] [PATCH 3/5] package/libva: bump to version 1.6.1
In-Reply-To: <1442658879-5494-1-git-send-email-bernd.kuhls@t-online.de>
References: <1442658879-5494-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1442658879-5494-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash | 4 ++--
 package/libva/libva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 82802ce..07284d2 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2015-July/003404.html
-sha1	f9d0cc8edb90a73146cc755f9e4ab94ddcdf8cd6	libva-1.6.0.tar.bz2
+# From http://lists.freedesktop.org/archives/libva/2015-September/003520.html
+sha1	84a026dfa8e3985a250ca92b135ae859ba5e9728	libva-1.6.1.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 18a322c..f8eab0f 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.6.0
+LIBVA_VERSION = 1.6.1
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
-- 
2.1.4
