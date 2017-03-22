From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 22:26:59 +0100
Subject: [Buildroot] [git commit] leptonica: make package description more
	accurate
Message-ID: <20170322212704.9449982647@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b2025e4daa61725c30a6e765763ed7135b900ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
