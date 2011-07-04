From: Diego Iastrubni <diegoiast@gmail.com>
Date: Mon, 4 Jul 2011 23:25:06 +0300
Subject: [Buildroot] [PATCH] fs/skeleton: allow rootfs not to be
	remounted read-write
In-Reply-To: <1309690563-9490-1-git-send-email-luca@lucaceresoli.net>
References: <1309690563-9490-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <CALR4fEKRmHBdjGznPFeS4R2DOkC9DE+X7_rfb6T=Rw4N1=xzzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 3, 2011 at 1:56 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
  +config BR2_REMOUNT_ROOTFS_RW
+       bool "remount root filesystem read-write during boot"
+       default y
+       help
+         The root filesystem is typically mounted read-only at boot.
+         By default, buildroot remounts it in read-write mode early during
the
+         boot process.
+         Say no here if you would rather like your root filesystem to
remain
+         read-only.
+         If unsure, say Y.
+
 endif # BR2_ROOTFS_SKELETON_DEFAULT


Wait... nothing breaks...? this just works?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110704/c2e09c1e/attachment.html>
