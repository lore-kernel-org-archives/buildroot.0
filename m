From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Feb 2016 10:33:33 -0300
Subject: [Buildroot] [PATCH] graphite2: switch homepage
Message-ID: <1455629613-16164-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Point to the official/proper one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.4.10
