From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 10:12:06 +0200
Subject: [Buildroot] [git commit] Config.in: fix help comment for gcc
	optimization
Message-ID: <20171021080457.C8E1380FEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e09fd8bdef6ddea1097f91df07515abde389cd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default for is set to BR2_OPTIMIZE_S, the help comment designated
BR2_OPTIMIZE_0 as default.
Changed the help comment to show that BR2_OPTIMIZE_S is the default.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 814dc02..9bdb0b8 100644
--- a/Config.in
+++ b/Config.in
@@ -458,7 +458,7 @@ choice
 config BR2_OPTIMIZE_0
 	bool "optimization level 0"
 	help
-	  Do not optimize. This is the default.
+	  Do not optimize.
 
 config BR2_OPTIMIZE_1
 	bool "optimization level 1"
@@ -525,6 +525,7 @@ config BR2_OPTIMIZE_S
 	  -falign-loops -falign-labels -freorder-blocks
 	  -freorder-blocks-and-partition -fprefetch-loop-arrays
 	  -ftree-vect-loop-version
+	  This is the default.
 
 endchoice
 
