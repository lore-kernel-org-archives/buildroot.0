From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  8 Sep 2016 18:13:37 -0300
Subject: [Buildroot] [PATCH] gtest: fix URL in package description
In-Reply-To: <20160906211731.4A63881F74@busybox.osuosl.org>
References: <20160906211731.4A63881F74@busybox.osuosl.org>
Message-ID: <1473369217-15546-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://code.google.com/p/googletest redirects to
https://github.com/google/googletest, now.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/gtest/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index c07f13b..355b736 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_GTEST
 	  This package allows running testsuites on the target which
 	  might be advantageous in certain cases.
 
-	  http://code.google.com/p/googletest/
+	  https://github.com/google/googletest
 
 comment "gtest needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
-- 
2.7.4
