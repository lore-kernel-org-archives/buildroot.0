From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Jul 2010 22:21:59 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: #361 / # 475 / #583
	are resolved
Message-ID: <20100718202311.730D282B7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=acb86bab1a4fa5228004327cca9f82db6c725265
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4f0ff49..f752f52 100644
--- a/CHANGES
+++ b/CHANGES
@@ -29,7 +29,10 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#361:  linux kernel configuration choice works incorrectly
 	#401:  new package: ffmpeg
+	#475:  uImage target for U-boot failed generating
+	#583:  build fails with external x86_64 toolchain
 	#835:  Package Dataflashboot-1.05 does not compile with buildroot...
 	#1213: Move .config into output directory
 	#1753: lmbench: convert to generic package infrastructure
-- 
1.7.1
