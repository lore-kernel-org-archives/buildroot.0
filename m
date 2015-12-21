From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 21 Dec 2015 11:57:16 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.2-10
Message-ID: <1450695436-26976-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 3931762..75ad035 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # From http://www.imagemagick.org/download/releases/digest.rdf
-sha256 eef80bf259823523dafbcdae15e236b443ecf6d4ae415106d7a861d1fa8d9d13  ImageMagick-6.9.2-7.tar.xz
+sha256 da2f6fba43d69f20ddb11783f13f77782b0b57783dde9cda39c9e5e733c2013c ImageMagick-6.9.2-10.tar.xz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 9238952..b3d6a83 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 6.9.2-7
+IMAGEMAGICK_VERSION = 6.9.2-10
 IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
1.9.1
