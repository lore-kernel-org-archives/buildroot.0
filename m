From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Oct 2009 00:20:17 +0100
Subject: [Buildroot] [git commit master] util-linux: fix kconfig typo
Message-ID: <20091029232038.C0A3F77719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=83f1ec65a0e3488376976754c5662330eab6fb80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 93a0522..e21daf6 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_UTIL-LINUX
 
 	  http://www.kernel.org/pub/linux/utils/util-linux/
 
-comment "netkitbase requires a toolchain with RPC support"
-        depends on !BR2_INET_RPC
+comment "util-linux requires a toolchain with RPC support"
+	depends on !BR2_INET_RPC
-- 
1.6.3.3
