From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Feb 2014 21:07:43 +0100
Subject: [Buildroot] [PATCH] manual: fix missing DL_DIR rename to BR2_DL_DIR
Message-ID: <1393272463-32021-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

There was one instance of DL_DIR that was left out. Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 14971b5..04e589f 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -253,7 +253,7 @@ information is (assuming the package name is +libfoo+) :
   Buildroot should download from +LIBFOO_SITE+ in addition to the main
   +LIBFOO_SOURCE+ (which usually is a tarball). Buildroot will not do
   anything with those additional files, except download files: it will
-  be up to the package recipe to use them from +$(DL_DIR)+.
+  be up to the package recipe to use them from +$(BR2_DL_DIR)+.
 
 * +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
   package source code. In many cases, Buildroot guesses the method
-- 
1.8.3.2
