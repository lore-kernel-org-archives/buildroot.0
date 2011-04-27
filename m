From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Apr 2011 22:13:48 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: FINEGRAINEDMTUNE: remove
	checks for unused/outdated versions
Message-ID: <20110427201948.514E48294E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fc8b7766355ed3776f454cd8fbb180150bd627f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 31f7150..17b21b8 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -41,7 +41,7 @@ endchoice
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
-	default y if !BR2_GCC_VERSION_4_2_1 && !BR2_GCC_VERSION_4_2_2 && !BR2_GCC_VERSION_4_2_3 && !BR2_GCC_VERSION_4_2_4 && !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
+	default y if !BR2_GCC_VERSION_4_2_4 && !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
-- 
1.7.3.4
