From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 Jul 2020 23:02:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/setools: add comment
Message-ID: <20200716210225.1966566-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 09b94b1e8f94d1f49f7a2349b4c8cbfecefa73da forgot to add the usual
comment that python3 dependency is due to python-networkx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/setools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 9475bbef65..882c8764f3 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SETOOLS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3 # python-networkx
 	select BR2_PACKAGE_PYTHON_NETWORKX # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	select BR2_PACKAGE_LIBSELINUX
-- 
2.27.0
