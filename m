From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  1 Nov 2014 19:08:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/tinyxml: fix the upstream URL
Message-ID: <1414865313-30621-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/tinyxml/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinyxml/Config.in b/package/tinyxml/Config.in
index 061ff67..466e391 100644
--- a/package/tinyxml/Config.in
+++ b/package/tinyxml/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_TINYXML
 	  TinyXML is a simple, small, C++ XML parser that can be
 	  easily integrating into other programs.
 
-	  https://github.com/leethomason/tinyxml2
+	  http://sourceforge.net/projects/tinyxml
 
 comment "tinyxml needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
1.9.3
