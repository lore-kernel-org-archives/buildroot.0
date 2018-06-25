From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 25 Jun 2018 17:39:09 -0300
Subject: [Buildroot] [PATCH] package/Config.in: fix alphabetical order
Message-ID: <20180625203909.14296-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit a098636a6b6 inserted LLVM between linux-pam and its plugins.

Change-Id: Idd298321da5742c8dcc75191c79cf22c663a95ff
Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 77e869ac42..8ad7a86fcb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1567,13 +1567,13 @@ menu "Other"
 	source "package/libuv/Config.in"
 	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
-	source "package/llvm/Config.in"
 if BR2_PACKAGE_LINUX_PAM
 comment "linux-pam plugins"
 	source "package/libpam-radius-auth/Config.in"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
+	source "package/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/mpc/Config.in"
 	source "package/mpdecimal/Config.in"
-- 
2.14.4
