From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:08:42 +0100
Subject: [Buildroot] [git commit] package/libva: bump version to 1.6.2
Message-ID: <20151219131256.1E0E181E34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7901ccfacdfeba471ae168deab49d08514da7100
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva/libva.hash | 4 ++--
 package/libva/libva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 07284d2..4d7cdaa 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2015-September/003520.html
-sha1	84a026dfa8e3985a250ca92b135ae859ba5e9728	libva-1.6.1.tar.bz2
+# From http://lists.freedesktop.org/archives/libva/2015-December/003819.html
+sha1	8a857db50305e9e3ddb8fe4e342ddd2924ae16f6	libva-1.6.2.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index f8eab0f..4adfd52 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.6.1
+LIBVA_VERSION = 1.6.2
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
