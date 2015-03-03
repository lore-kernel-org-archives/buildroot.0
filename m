From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 21:56:51 +0100
Subject: [Buildroot] [git commit] syslinux: add hash
Message-ID: <20150303212043.EC05B7FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03f373184b0264886e1ed766f673779b90af1af2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/syslinux.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/boot/syslinux/syslinux.hash b/boot/syslinux/syslinux.hash
new file mode 100644
index 0000000..4ec039f
--- /dev/null
+++ b/boot/syslinux/syslinux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/boot/syslinux/sha256sums.asc
+sha256	afa31b7cbf72e1c0c1752a0636ba724ce01c0e374366e46e61db6862b4685478	syslinux-6.02.tar.xz
