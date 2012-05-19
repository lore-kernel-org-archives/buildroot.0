From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 May 2012 23:11:03 +0200
Subject: [Buildroot] [git commit branch/next] toolchain/gcc: bump snapshot
	version
Message-ID: <20120519212855.EC45796D3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0049aa83b91299abbf97b5d06d6c2772e8e6a4b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump default snapshot gcc version to 4.8-20120429 so that it is newer
than our latest supported version (4.7.0 release).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 4bff885..0c1243f 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -45,7 +45,7 @@ config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
-	default "4.7-20110430"
+	default "4.8-20120429"
 	depends on BR2_GCC_VERSION_SNAP
 	help
 	  Enter snapshot date to use for gcc.
