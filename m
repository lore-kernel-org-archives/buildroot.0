From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Apr 2017 19:24:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/libva: bump version to 1.8.1
Message-ID: <20170410172432.10315-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 086a010b93..0590423537 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,4 +1,4 @@
-# From https://lists.01.org/pipermail/intel-vaapi-media/2017-March/000015.html
-sha1 d9468956c301784b6b12c39cafd30ac52e24290b libva-1.8.0.tar.bz2
+# From https://github.com/01org/libva/releases
+sha1 ae1f580d3ca54199393133214ac1e5a66d9cbeb3  libva-1.8.1.tar.bz2
 # Locally computed
-sha256 eb92f3dcbe3981df3575348377263b31361113c77b2c3745f23174d1f562d658  libva-1.8.0.tar.bz2
+sha256 c1d5d85b6b40b76f37993b4da33388d3d73b64998dcbc160b7578e24ed775c73  libva-1.8.1.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index f16be900b5..ffd990fab3 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.8.0
+LIBVA_VERSION = 1.8.1
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/01org/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
-- 
2.11.0
