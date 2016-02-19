From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Feb 2016 16:34:29 +0100
Subject: [Buildroot] [git commit] glibc: bump default to version 2.22
Message-ID: <20160302202752.F0F3D7FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35e19d4f3fd3d40acdbe6fc2cdac7abf13aedb08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index d8f54b6..f839e29 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -32,7 +32,7 @@ config BR2_PACKAGE_GLIBC
 
 choice
 	prompt "glibc version"
-	default BR2_GLIBC_VERSION_2_21
+	default BR2_GLIBC_VERSION_2_22
 
 config BR2_GLIBC_VERSION_2_21
 	bool "2.21"
