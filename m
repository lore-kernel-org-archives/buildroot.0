From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Mar 2016 17:36:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcrossguid: Fix typo in Config.in
Message-ID: <1457886960-19358-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcrossguid/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcrossguid/Config.in b/package/libcrossguid/Config.in
index 907ad2d..61ca781 100644
--- a/package/libcrossguid/Config.in
+++ b/package/libcrossguid/Config.in
@@ -11,5 +11,5 @@ config BR2_PACKAGE_LIBCROSSGUID
 	  https://github.com/graeme-hill/crossguid
 
 comment "libcrossguid needs a toolchain w/ C++, wchar, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \\
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.7.0
