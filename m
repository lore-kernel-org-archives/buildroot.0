From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2014 22:10:02 +0100
Subject: [Buildroot] [git commit] gcc: arc: bump to git commit c6227bc
Message-ID: <20140228133411.B939B9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06bd17bdff90d15578ce11ae4ebbc3494b1571da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes two issues: one segmentation fault in GCC and one invalid code
generation. Those fix numerous autobuild failures, including:
http://autobuild.buildroot.net/results/715/7158a2a19da6bfa950125a951a39061ccaa73101/
http://autobuild.buildroot.net/results/9d4/9d4fbcb91cf76e01c833d70c401c0828ad37631a/
http://autobuild.buildroot.net/results/ef6/ef6a0e2d382ae202bb8f0e9fc9f5e48c90119faf/
http://autobuild.buildroot.net/results/276/27692619efee482cded56967017f260bd30eefe7/

Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 7bd1eb3..4fd8ec9 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -96,7 +96,7 @@ config BR2_GCC_VERSION
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.2"     if BR2_GCC_VERSION_4_8_X
-	default "7466697995233cc3aab5b9427bf843e3c7fabd80" if BR2_GCC_VERSION_4_8_ARC
+	default "c6227bc154124e270f15793deddfa3fe18f7db54" if BR2_GCC_VERSION_4_8_ARC
 	default "b93bb009e021aba64dd4b8cdb0bbc5a176c55543" if BR2_GCC_VERSION_4_9_MICROBLAZE
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
