From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] lmbench: indentation in Config.in
	should be done using <tab>
Message-ID: <20100526122003.3F52A1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=883e6043dc4201708d6625d70b62212752904265
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lmbench/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index d09a333..c8423d1 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_LMBENCH
 	  http://sourceforge.net/projects/lmbench/
 
 comment "lmbench requires a toolchain with RPC support"
-        depends on !BR2_INET_RPC
+	depends on !BR2_INET_RPC
-- 
1.6.3.3
