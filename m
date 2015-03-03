From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 13:13:34 -0300
Subject: [Buildroot] [PATCH 1/3] syslinux: add hash
Message-ID: <1425399216-3522-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/syslinux/syslinux.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 boot/syslinux/syslinux.hash

diff --git a/boot/syslinux/syslinux.hash b/boot/syslinux/syslinux.hash
new file mode 100644
index 0000000..4ec039f
--- /dev/null
+++ b/boot/syslinux/syslinux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/boot/syslinux/sha256sums.asc
+sha256	afa31b7cbf72e1c0c1752a0636ba724ce01c0e374366e46e61db6862b4685478	syslinux-6.02.tar.xz
-- 
2.0.5
