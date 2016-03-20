From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 14:56:55 +0100
Subject: [Buildroot] [git commit] package/libva: bump version to 1.7.0
Message-ID: <20160320135747.39A24817A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b55576f96a890df112d97f76717aa1404c854a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva/libva.hash | 4 ++--
 package/libva/libva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 4d7cdaa..0211365 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2015-December/003819.html
-sha1	8a857db50305e9e3ddb8fe4e342ddd2924ae16f6	libva-1.6.2.tar.bz2
+# From https://lists.freedesktop.org/archives/libva/2016-March/003885.html
+sha1	e1e440da60b11986afb54fc130c7707f11827298	libva-1.7.0.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 4adfd52..e11bed3 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.6.2
+LIBVA_VERSION = 1.7.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
