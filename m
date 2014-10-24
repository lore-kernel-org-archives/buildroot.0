From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 01:21:10 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 1.4.1
Message-ID: <20141024232206.F1140B0BC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6ee88f4806b50d7108ec382579e04b68a5d4f42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva/libva.hash |    4 ++--
 package/libva/libva.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 0495000..2c611a5 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2014-September/002746.html
-sha1	5704e728aa59a748cf820ac2a5efe0764f6e4b01	libva-1.4.0.tar.bz2
+# http://lists.freedesktop.org/archives/libva/2014-October/002778.html
+sha1	23415d5ad50725ac1d1b7d64401f776c13c305ae	libva-1.4.1.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 984222d..e9892d3 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.4.0
+LIBVA_VERSION = 1.4.1
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
