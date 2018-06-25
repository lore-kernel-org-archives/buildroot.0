From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 23:11:13 +0200
Subject: [Buildroot] [git commit] package/Config.in: fix alphabetical order
Message-ID: <20180625210823.7E23081415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b71204fe373541bd66eae7e0274d9c5ddaa6a17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a098636a6b6 inserted LLVM between linux-pam and its plugins.

Change-Id: Idd298321da5742c8dcc75191c79cf22c663a95ff
Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 13b34aed04..c5365547a4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1569,13 +1569,13 @@ menu "Other"
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
