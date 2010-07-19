From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Jul 2010 09:42:56 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: #321 / #1393 are
	resolved
Message-ID: <20100719074322.4A0758287F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5bf7eb2a72ed3bd0d549df63ed2b4e4b54be2343
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5964ada..f30da84 100644
--- a/CHANGES
+++ b/CHANGES
@@ -29,6 +29,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#321:  alsa-lib uses host include files for python which breaks ...
 	#361:  linux kernel configuration choice works incorrectly
 	#387:  Tremor not installed to toolchain
 	#401:  new package: ffmpeg
@@ -37,6 +38,7 @@
 	#729:  sstrip creates corrupted headers
 	#835:  Package Dataflashboot-1.05 does not compile with buildroot...
 	#1213: Move .config into output directory
+	#1393: neon config fails libxml/parser.h: libxml2 requires, but not ...
 	#1753: lmbench: convert to generic package infrastructure
 	#1771: Fakeroot and the target/generic/device_table.txt create bad...
 	#1807: LZMA 4.32.7, Required header file(s) are missing
-- 
1.7.1
