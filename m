From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Jul 2015 21:54:54 +0200
Subject: [Buildroot] [PATCH 2/4] package/libva: bump version to 1.6.0
In-Reply-To: <1435780496-31814-1-git-send-email-bernd.kuhls@t-online.de>
References: <1435780496-31814-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1435780496-31814-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash |    4 ++--
 package/libva/libva.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index eaec0af..82802ce 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2015-March/003249.html
-sha1	b315a86fcd3bd1e073e2c1b62416550885cd7420	libva-1.5.1.tar.bz2
+# From http://lists.freedesktop.org/archives/libva/2015-July/003404.html
+sha1	f9d0cc8edb90a73146cc755f9e4ab94ddcdf8cd6	libva-1.6.0.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index d3b58ae..18a322c 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.5.1
+LIBVA_VERSION = 1.6.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
-- 
1.7.10.4
