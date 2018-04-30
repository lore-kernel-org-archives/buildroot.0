From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Apr 2018 21:28:47 +0300
Subject: [Buildroot] [PATCH] sdl2: update license file hash
Message-ID: <d2cefeedde196a7c6a05d8002fc686b26d31ec48.1525112927.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Copyright year update.

Fixes:
http://autobuild.buildroot.net/results/2c8/2c865463a4b7524114518c04dce9c94252433460/

Cc: Guillaume Gardet <guillaume.gardet@oliseo.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sdl2/sdl2.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index 9cf2c417880c..997b4a5d4fcb 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.8.tar.gz.sig
 sha256 edc77c57308661d576e843344d8638e025a7818bff73f8fbfab09c3c5fd092ec  SDL2-2.0.8.tar.gz
 # Locally calculated
-sha256 bbd2edb1789c33de29bb9f8d1dbe2774584a9ce8c4e3162944b7a3a447f5e85d  COPYING.txt
+sha256 61e627031e1160bf8b9bdbc9cda27656d422ea8eaab199b64b4a4a4168437154  COPYING.txt
-- 
2.17.0
