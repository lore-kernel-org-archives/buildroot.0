From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:53:10 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 1.8.1
Message-ID: <20170412195328.10CCD7FC21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=894e4df127afe7393d473ba086af7bcbbdf0aa8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 086a010..0590423 100644
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
index f16be90..ffd990f 100644
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
