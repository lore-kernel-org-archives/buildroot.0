From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 21:50:42 +0100
Subject: [Buildroot] [git commit] graphite2: switch homepage
Message-ID: <20160216205104.4731281836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3fac0dcfdf5bc6728ec4e6063832c2f2342f920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Point to the official/proper one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/graphite2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/graphite2/Config.in b/package/graphite2/Config.in
index 0ec07a2..5499e17 100644
--- a/package/graphite2/Config.in
+++ b/package/graphite2/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_GRAPHITE2
 	  groups to provide cross-platform rendering for complex
 	  writing systems.
 
-	  http://sourceforge.net/projects/silgraphite/
+	  http://graphite.sil.org/
 
 comment "graphite2 needs a toolchain w/ C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
