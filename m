From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Apr 2018 09:26:26 +0300
Subject: [Buildroot] [PATCH] alsa-lib: update license file hash
Message-ID: <274fd6a1819b9fcbab06a6992586fbf2ec77edaf.1523859986.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FSF address update.

Fixes:
http://autobuild.buildroot.net/results/1b9/1b9ec9cc0f22a58ad37f21be1b6eb4cc064b6dbc/
http://autobuild.buildroot.net/results/d32/d32ae8b67c1aade7225c42a4685dc62fdaa0b0e3/
http://autobuild.buildroot.net/results/d9b/d9b8e918fa4a1f7a9470473f82bb21b3dce1acc4/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index d2434380bdc9..c4f16d6df370 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
 sha256 5f2cd274b272cae0d0d111e8a9e363f08783329157e8dd68b3de0c096de6d724  alsa-lib-1.1.6.tar.bz2
-sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+sha256 32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256 bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
-- 
2.17.0
