From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2015 23:40:17 +0100
Subject: [Buildroot] [git commit] uboot: fix hash for 2015.10 version
Message-ID: <20151028224140.E8B6A800F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6c286833f778e40ea2959495a932084fe04cfad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit bf2bd1132128175362cba26d80d8ef4216b2c32c bumped U-Boot to version
2015.10 but forgot to update the hash as well.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 3b687d5..b1d8ba0 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	0b48c9bd717f2c322ef791f8282e14c88be942dc7d1226df7e31a812a3af94d9  u-boot-2015.07.tar.bz2
+sha256  bdc68d5f9455ad933b059c735d983f2c8b6b552dafb062e5ff1444f623021955  u-boot-2015.10.tar.bz2
