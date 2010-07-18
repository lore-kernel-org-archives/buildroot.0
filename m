From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Jul 2010 22:46:06 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: #387 / #729 are
	resolved
Message-ID: <20100718204733.59F6A82BB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ad36fcdda0de654e7da5ba84015b92e48a576e69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index db8bf16..e6fbe35 100644
--- a/CHANGES
+++ b/CHANGES
@@ -30,9 +30,11 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#361:  linux kernel configuration choice works incorrectly
+	#387:  Tremor not installed to toolchain
 	#401:  new package: ffmpeg
 	#475:  uImage target for U-boot failed generating
 	#583:  build fails with external x86_64 toolchain
+	#729:  sstrip creates corrupted headers
 	#835:  Package Dataflashboot-1.05 does not compile with buildroot...
 	#1213: Move .config into output directory
 	#1753: lmbench: convert to generic package infrastructure
-- 
1.7.1
