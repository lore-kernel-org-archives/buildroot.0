From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 15:29:19 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 1.7.1
Message-ID: <20160625132932.2445D7FF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7f8161a35f24b6b0b6c54d211ba5f9c9691448d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva/libva.hash | 4 ++--
 package/libva/libva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 0211365..8e8d348 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/libva/2016-March/003885.html
-sha1	e1e440da60b11986afb54fc130c7707f11827298	libva-1.7.0.tar.bz2
+# From https://lists.freedesktop.org/archives/libva/2016-June/004034.html
+sha1	6405ce9adcad2bc31122d766f2a99250657f9f8a	libva-1.7.1.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index e11bed3..b6a7ca5 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.7.0
+LIBVA_VERSION = 1.7.1
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
