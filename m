From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 13:18:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/setools: add homepage to Config.in
Message-ID: <1453637930-22647-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/setools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 7bab789..c291b21 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -26,6 +26,8 @@ config BR2_PACKAGE_SETOOLS
 	   * secmds - command-line tools to analyze and search SELinux
 	     policy.
 
+	  https://github.com/TresysTechnology/setools3/wiki
+
 comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
-- 
2.7.0.rc3
