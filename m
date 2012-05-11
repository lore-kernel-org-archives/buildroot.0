From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 10:36:05 -0300
Subject: [Buildroot] [PATCH 1/2] toolchain/gcc: bump snapshot version
Message-ID: <1336743366-20014-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump default snapshot gcc version to 4.8-20120429 so that it is newer
than our latest supported version (4.7.0 release).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
