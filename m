From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 10:01:11 +0200
Subject: [Buildroot] [git commit] boot/uboot: add hash file
Message-ID: <20150419081557.B366E81918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d72192ce5a388cc0af3725700740ef67f43d752c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
new file mode 100644
index 0000000..9cc96f6
--- /dev/null
+++ b/boot/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	0a1a70df586655f527befa6f12e184e96ed61b126e5a567382321b17200f5d60  u-boot-2015.04.tar.bz2
