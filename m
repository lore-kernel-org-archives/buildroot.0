From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 19:17:02 +0200
Subject: [Buildroot] [git commit] docs/manual/beyond-buildroot: additional
	minor fixes
Message-ID: <20150710171730.82587818ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=821f30c82c41b15ca432c01ec7dfb8060941b08d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those issues were noticed by Thomas De Schampheleire during the
review, but they were forgotten when applying the patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/beyond-buildroot.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index 63b0c1f..eefea1f 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -38,13 +38,13 @@ You can test your live CD image using QEMU:
 qemu-system-i386 -cdrom output/images/rootfs.iso9660
 -------------------
 
-Or use it as a hard-drive image if it is an hybrid ISO:
+Or use it as a hard-drive image if it is a hybrid ISO:
 
 -------------------
 qemu-system-i386 -hda output/images/rootfs.iso9660
 -------------------
 
-It can be easily flashed to an USB drive with +dd+:
+It can be easily flashed to a USB drive with +dd+:
 
 -------------------
 dd if=output/images/rootfs.iso9660 of=/dev/sdb
