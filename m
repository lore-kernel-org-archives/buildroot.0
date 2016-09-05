From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 22:17:47 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 1.7.2
Message-ID: <20160905201853.ABFC7821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56fd53734731e13339edc2b82bdd63160f3f135d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva/libva.hash | 4 ++--
 package/libva/libva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 8e8d348..c2e5ea4 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/libva/2016-June/004034.html
-sha1	6405ce9adcad2bc31122d766f2a99250657f9f8a	libva-1.7.1.tar.bz2
+# From https://lists.freedesktop.org/archives/libva/2016-September/004379.html
+sha1 a89680d34236fdc63adeec25cf431c005644b8c6  libva-1.7.2.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index b6a7ca5..df1758e 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.7.1
+LIBVA_VERSION = 1.7.2
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
