From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:14:39 +0200
Subject: [Buildroot] [git commit] package/sdl2_image: bump to version 2.0.5
Message-ID: <20190927211455.883008F7E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1c43f1f2ba2f7d12b20b00feee2f9aba5bdd3ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the license is updated because the copyright year was
updated in COPYING.txt:

-  Copyright (C) 1997-2018 Sam Lantinga <slouken@libsdl.org>
+  Copyright (C) 1997-2019 Sam Lantinga <slouken@libsdl.org>

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2_image/sdl2_image.hash | 4 ++--
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index cf3253526c..621a920219 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3510c25da735ffcd8ce3b65073150ff4f7f9493b866e85b83738083b556d2368  SDL2_image-2.0.3.tar.gz
-sha256 13240ed78c8726c510b9634976430d3d3a9ea2d1ced3214119766e9e71568a35  COPYING.txt
+sha256 bdd5f6e026682f7d7e1be0b6051b209da2f402a2dd8bd1c4bd9c25ad263108d0  SDL2_image-2.0.5.tar.gz
+sha256 45079362e2230154205413a6940544ca94e3479ccf76205c71c4f542a6815d25  COPYING.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 8c1c5f6e1a..68572b3f9f 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.0.3
+SDL2_IMAGE_VERSION = 2.0.5
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
