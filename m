From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Feb 2010 11:01:04 +0100
Subject: [Buildroot] [git commit master] toolchain: get rid of "binary" for
	external toolchain
Message-ID: <20100208100237.0CB67776EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ecc81fed2f1ba2053d29d8f16246329f3cceb99e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer have an option for external source based toolchains,
so get rid of "binary".

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ee34e03..ee94143 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -12,7 +12,7 @@ config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 
 config BR2_TOOLCHAIN_EXTERNAL
-	bool "External binary toolchain"
+	bool "External toolchain"
 
 endchoice
 
-- 
1.6.3.3
