From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 29 Sep 2019 20:15:17 +0200
Subject: [Buildroot] [PATCH] package/sdl2_ttf: remove trailing whitespace
Message-ID: <1569780917-726-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 $: ./utils/check-package package/sdl2_ttf/*
 package/sdl2_ttf/sdl2_ttf.hash:1: line contains trailing whitespace
 42 lines processed
 1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/sdl2_ttf/sdl2_ttf.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 4559cce..1e83941 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,2 +1,2 @@
-# Locally calculated 
+# Locally calculated
 sha256 a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33  SDL2_ttf-2.0.15.tar.gz
-- 
2.7.4
