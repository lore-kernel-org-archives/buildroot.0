From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 18:28:43 +0100
Subject: [Buildroot] [git commit] package/libva: bump version to 1.5.0
Message-ID: <20150104172915.03EF08043A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31221b964e5d6b51bbea275f70f95cc99a3e4001
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva/libva.hash |    4 ++--
 package/libva/libva.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 2c611a5..ec87e26 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# http://lists.freedesktop.org/archives/libva/2014-October/002778.html
-sha1	23415d5ad50725ac1d1b7d64401f776c13c305ae	libva-1.4.1.tar.bz2
+# http://lists.freedesktop.org/archives/libva/2014-December/002981.html
+sha1	f83cc0d1dd42701ec79d943d9462f092d32c51fa	libva-1.5.0.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index e9892d3..176c498 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.4.1
+LIBVA_VERSION = 1.5.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
