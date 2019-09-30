From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:34:58 +0200
Subject: [Buildroot] [git commit] package/sdl2_ttf: remove trailing
 whitespace
Message-ID: <20190930192936.9FC4583930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df573559f55009593828b6c1955e83e74fa103c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 $: ./utils/check-package package/sdl2_ttf/*
 package/sdl2_ttf/sdl2_ttf.hash:1: line contains trailing whitespace
 42 lines processed
 1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2_ttf/sdl2_ttf.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 4559ccec62..1e83941758 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,2 +1,2 @@
-# Locally calculated 
+# Locally calculated
 sha256 a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33  SDL2_ttf-2.0.15.tar.gz
