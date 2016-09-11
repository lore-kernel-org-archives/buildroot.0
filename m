From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 21:59:07 +0200
Subject: [Buildroot] [git commit] gtest: fix URL in package description
Message-ID: <20160911195911.2842181DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66c1d1dc169d11d7bcf8db115d6e6ea03ccb8d73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://code.google.com/p/googletest redirects to
https://github.com/google/googletest, now.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
