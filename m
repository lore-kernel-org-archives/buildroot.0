From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 12 Apr 2015 10:43:05 +0200
Subject: [Buildroot] [PATCH] giflib: fix description about compatibility
	with libungif
Message-ID: <1428828185-19869-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/giflib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/giflib/Config.in b/package/giflib/Config.in
index 70368dc..bb5741a 100644
--- a/package/giflib/Config.in
+++ b/package/giflib/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GIFLIB
 	bool "giflib"
 	help
-	  giflib is a library for reading and writing gif images. It is API and
+	  giflib is a library for reading and writing gif images. It was API and
 	  ABI compatible with libungif which was in wide use while the LZW
 	  compression algorithm was patented.
 
-- 
2.3.4
