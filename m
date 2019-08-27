From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 27 Aug 2019 20:43:45 +0200
Subject: [Buildroot] [PATCH] package/feh: bump to version 3.2.1
Message-ID: <20190827184345.23013-1-petr.vorel@gmail.com>
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
index 02a88fbda9..2bfe5e48a8 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 9fe840fbc6ce66dcf1e99296c90eb6fc44a4c2fad9a1069dfc7e0fad88eb56ef  feh-3.1.3.tar.bz2
+sha256 8f9741399b4b184ba28698c0fd7722638e79abac8e6c27eb526cc52b11ee0a1c  feh-3.2.1.tar.bz2
 sha256 a289176a74d8e5d071456df5d4ee629aeb86f8eeeb6570076fe126f182c6b91d  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index ac79a7da64..973eed60b0 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.1.3
+FEH_VERSION = 3.2.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
-- 
2.22.0
