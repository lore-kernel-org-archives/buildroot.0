From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:20 +0100
Subject: [Buildroot] [git commit] foundation-v8/readme.txt: remove outdated
	rpc comment
Message-ID: <20121106072433.3487F998E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=448b7069b2bd1b57fe39f90bccc5271c06a36110
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we don't automatically enable rpc stuff in busybox this comment
no longer applies.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/arm/foundation-v8/readme.txt |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/board/arm/foundation-v8/readme.txt b/board/arm/foundation-v8/readme.txt
index 3f8d4ef..7f419a0 100644
--- a/board/arm/foundation-v8/readme.txt
+++ b/board/arm/foundation-v8/readme.txt
@@ -8,13 +8,6 @@ First, one has to download the AArch64 software simulator from:
 Then, use the arm_foundationv8_defconfig configuration to build your
 Buildroot system.
 
-Note that the Busybox build will fail due to the lack of rpc/rpc.h
-(the AArch64 toolchain does not have RPC support). Run 'make
-busybox-menuconfig', and in 'Linux System Utilities', disable the
-option 'Support mounting NFS file systems on Linux < 2.6.23' and
-restart the build. This problem will be fix in upcomins versions of
-Buildroot.
-
 Finally, boot your system with:
 
  ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/Foundation_v8 \
