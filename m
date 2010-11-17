From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 17 Nov 2010 23:21:45 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain-external: fix
	indentation in Kconfig
Message-ID: <20101117222502.AC36B8E964@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=50003798b3508d0dbd106938d13e9d834c03f2b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index efc8378..a340de6 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -14,9 +14,9 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 endchoice
 
 config BR2_TOOLCHAIN_EXTERNAL_STRIP
-        bool
-        default y
-        prompt "Strip shared libraries"
+	bool
+	default y
+	prompt "Strip shared libraries"
 	help
 	  Strip shared libraries copied from the external toolchain.
 endif
-- 
1.7.1
