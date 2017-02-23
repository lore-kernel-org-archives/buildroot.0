From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:53:09 +0100
Subject: [Buildroot] [git commit] gstreamer1: bump to version 1.10.4
Message-ID: <20170223215424.1211D82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bdd3647167ac2934e31cf44e68ef19949ec1831
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index f65061b..455e7fb 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.3.tar.xz.sha256sum
-sha256 85b9dc1b2991f224fa90d534ec57014896c479e061dc9fa1bc16ae17cbebb63d  gstreamer-1.10.3.tar.xz
+# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.4.tar.xz.sha256sum
+sha256 50c2f5af50a6cc6c0a3f3ed43bdd8b5e2bff00bacfb766d4be139ec06d8b5218  gstreamer-1.10.4.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index e110dee..5a0a369 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.10.3
+GSTREAMER1_VERSION = 1.10.4
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
