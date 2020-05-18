From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 18 May 2020 20:33:19 +0200
Subject: [Buildroot] [NEXT][PATCH 1/1] package/feh: bump to version 3.4
Message-ID: <20200518183319.23987-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

tested locally on MUSL.

Probably for next, but 3.4 also fixes memory leak
https://git.finalrewind.org/feh/plain/ChangeLog
* Fix a memory leak when repeatedly cycling through slideshows containing
images loaded via libcurl, ImageMagick or dcraw.

Kind regards,
Petr

 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 2bfe5e48a8..c39abd0ee7 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 8f9741399b4b184ba28698c0fd7722638e79abac8e6c27eb526cc52b11ee0a1c  feh-3.2.1.tar.bz2
+sha256 18545ca5c7537268810bec564db9cd3ad1ca98c2a2f23ec243d3bac56cfc0365  feh-3.4.tar.bz2
 sha256 a289176a74d8e5d071456df5d4ee629aeb86f8eeeb6570076fe126f182c6b91d  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 973eed60b0..90f8ff6579 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.2.1
+FEH_VERSION = 3.4
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
-- 
2.26.2
