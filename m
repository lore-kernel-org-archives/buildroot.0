From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 21:15:22 +0100
Subject: [Buildroot] [git commit] package/libcrossguid: Fix typo in Config.in
Message-ID: <20160313204834.640CC8184D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5940e2e6af1675fe3ad0d26b744f8b4401cf289a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
