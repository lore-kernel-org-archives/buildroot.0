From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  3 Mar 2017 07:53:57 +0200
Subject: [Buildroot] [PATCH] yaml-cpp: update homepage link
Message-ID: <d4333dd8579d629200b06cbaad8fee4362ab212f.1488520437.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/yaml-cpp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
index c1ba410a6b2e..6d34f4210e00 100644
--- a/package/yaml-cpp/Config.in
+++ b/package/yaml-cpp/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_YAML_CPP
 	  yaml-cpp is a YAML parser and emitter in C++ matching
 	  the YAML 1.2 spec.
 
-	  https://code.google.com/p/yaml-cpp/
+	  https://github.com/jbeder/yaml-cpp
 
 comment "yaml-cpp needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.11.0
