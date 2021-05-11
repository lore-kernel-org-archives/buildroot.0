From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 09:09:07 +0200
Subject: [Buildroot] [git commit] boot/Config.in: fix beaglev-ddrinit
 include after rename
Message-ID: <20210511064153.8CB5686F32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49453aea90a8356c664b49e1c85d42ca4c40c09d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3b551f68a55d74f (boot/beaglev-ddrlnit: rename to beaglev-ddrinit to
match renamed upstream repo) forgot to update the include in boot/Config.in,
breaking menuconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/Config.in b/boot/Config.in
index 54c2b7605d..08d9ac06b2 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -6,7 +6,7 @@ source "boot/at91bootstrap3/Config.in"
 source "boot/at91dataflashboot/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
-source "boot/beaglev-ddrlnit/Config.in"
+source "boot/beaglev-ddrinit/Config.in"
 source "boot/beaglev-secondboot/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
