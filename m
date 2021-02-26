From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Fri, 26 Feb 2021 09:59:35 +0100
Subject: [Buildroot] [PATCH] package/libxcrypt: fix legal info
Message-ID: <20210226085935.3013-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

fixes
http://autobuild.buildroot.net/results/206aac81799074ef45c0cc7b9979cbf02c3935d5
http://autobuild.buildroot.net/results/8db5df1286673fdedb854bad2b9e5757d5218950

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index b56ab6beaf..d5d3710b71 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
 sha256 7665168d0409574a03f7b484682e68334764c29c21ca5df438955a381384ca07  libxcrypt-4.4.17.tar.gz
-sha256 f8198fcc4f002bf54512bac2e68e1e3f04af7d105f4f4f98d7d22cb110e04715  LICENSING
+sha256 9178c76310a1136274d485e606ad92b6f8df265fc736642f5421d628214acc76  LICENSING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-- 
2.20.1
