From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 15:11:44 +0200
Subject: [Buildroot] [git commit] package/setools: add comment about Python
 3.x dependency
Message-ID: <20200727130700.7C29588E5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=264db6b8972b34029a3075e120f949a78684b5b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 09b94b1e8f94d1f49f7a2349b4c8cbfecefa73da forgot to add the
usual comment that python3 dependency is due to python-networkx.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/setools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 3ab7f55948..b26029a162 100644
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
