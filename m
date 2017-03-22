From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 22 Mar 2017 07:41:26 +0100
Subject: [Buildroot] [PATCH 1/2] leptonica: make package description more
	accurate
Message-ID: <1490164887-2707-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/leptonica/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/leptonica/Config.in b/package/leptonica/Config.in
index a4053a3..ec4920c 100644
--- a/package/leptonica/Config.in
+++ b/package/leptonica/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_LEPTONICA
 	bool "leptonica"
 	help
-	  Leptonica is a pedagogically-oriented open source site containing
-	  software that is broadly useful for image processing and image
-	  analysis applications.
+	  Leptonica is an image processing and image analysis library.
 
 	  http://www.leptonica.org/
-- 
2.5.0
