From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 13 Oct 2016 11:31:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libamcodec: indentation cleanup
Message-ID: <1476351090-22045-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libamcodec/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libamcodec/Config.in b/package/libamcodec/Config.in
index 7300259..ded6b68 100644
--- a/package/libamcodec/Config.in
+++ b/package/libamcodec/Config.in
@@ -9,6 +9,6 @@ config BR2_PACKAGE_LIBAMCODEC
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_ALSA_LIB
 	help
-	    Interface library for Amlogic media codecs
+	  Interface library for Amlogic media codecs
 
-	    https://github.com/mdrjr/c2_aml_libs.git
+	  https://github.com/mdrjr/c2_aml_libs.git
-- 
1.9.1
