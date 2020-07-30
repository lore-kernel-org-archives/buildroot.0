From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 30 Jul 2020 06:25:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/feh: bump version to 3.4.1
Message-ID: <20200730042509.4593-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index c39abd0ee7..eea32dbca5 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 18545ca5c7537268810bec564db9cd3ad1ca98c2a2f23ec243d3bac56cfc0365  feh-3.4.tar.bz2
+sha256 782463034ab0135bc8438515191f986db23a79d502154d23a7c07a7574907b7b  feh-3.4.1.tar.bz2
 sha256 a289176a74d8e5d071456df5d4ee629aeb86f8eeeb6570076fe126f182c6b91d  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 90f8ff6579..8ba9e40dd8 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.4
+FEH_VERSION = 3.4.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
-- 
2.27.0
