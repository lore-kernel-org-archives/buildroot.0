From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Apr 2011 15:40:58 +0200
Subject: [Buildroot] [git commit] toolchain-external: remove extra space in
	RPC option string
Message-ID: <20110429134747.D0ED082B3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8b370e63806fa2ab064cd2b30d627914cc5c0a43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d9a0034..1cbf554 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -189,7 +189,7 @@ config BR2_TOOLCHAIN_EXTERNAL_INET_IPV6
 	  will tell you if it's correct or not.
 
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
-	bool "Toolchain has RPC support ?"
+	bool "Toolchain has RPC support?"
 	select BR2_INET_RPC
 	help
 	  Select this option if your external toolchain supports
-- 
1.7.3.4
