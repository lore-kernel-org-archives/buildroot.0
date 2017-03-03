From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 08:40:34 +0100
Subject: [Buildroot] [git commit] yaml-cpp: update homepage link
Message-ID: <20170303074100.45FBD822A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1304933ddd24283415751dac61d35f14413c56fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/yaml-cpp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
index c1ba410..6d34f42 100644
--- a/package/yaml-cpp/Config.in
+++ b/package/yaml-cpp/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_YAML_CPP
 	  yaml-cpp is a YAML parser and emitter in C++ matching
 	  the YAML 1.2 spec.
 
-	  https://code.google.com/p/yaml-cpp/
+	  https://github.com/jbeder/yaml-cpp
 
 comment "yaml-cpp needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
