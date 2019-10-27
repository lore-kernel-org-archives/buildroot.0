From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Oct 2019 18:37:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/mdevd: fix license hash
Message-ID: <20191027173759.5294-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/963/963ea38f496cca8d1cc6db7b6d963d0bf40bdef8/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mdevd/mdevd.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
index 55b0af4496..b4652c6b67 100644
--- a/package/mdevd/mdevd.hash
+++ b/package/mdevd/mdevd.hash
@@ -1,3 +1,3 @@
 # Locally generated
 sha256 302819dceb2400f299ef8f04828a4fe9156d7334e41ce34d61db37fbc2aa7e8f  mdevd-0.1.1.0.tar.gz
-sha256 e5319cb67bd1d896f3b2fa1136034b1b155a6e278ab1c2578a394f758f0034c1  COPYING
+sha256 2e59eb9754eaece119072a4379d8b320900cc8c4a1a488d2d7788768b95e89ae  COPYING
-- 
2.20.1
