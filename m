From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:34 +0200
Subject: [Buildroot] [git commit] board/gdb/bfin-bf512: remove host/usr
	reference from readme.txt
Message-ID: <20170705141336.7ECCE81D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23671c2f4c8a366f6d382e0a27d6c44612989234
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/gdb/bfin-bf512/readme.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/gdb/bfin-bf512/readme.txt b/board/gdb/bfin-bf512/readme.txt
index a56b5bc..b8ff250 100644
--- a/board/gdb/bfin-bf512/readme.txt
+++ b/board/gdb/bfin-bf512/readme.txt
@@ -1,10 +1,10 @@
 Run the simulation with GDB for FDPIC:
 
- ./output/host/usr/bin/bfin-buildroot-linux-uclibc-run --env operating --model bf512 output/images/vmlinux
+ ./output/host/bin/bfin-buildroot-linux-uclibc-run --env operating --model bf512 output/images/vmlinux
 
 Run the simulation with GDB for FLAT:
 
- ./output/host/usr/bin/bfin-buildroot-uclinux-uclibc-run --env operating --model bf512 output/images/vmlinux
+ ./output/host/bin/bfin-buildroot-uclinux-uclibc-run --env operating --model bf512 output/images/vmlinux
 
 The login prompt will appear in the terminal that started GDB.
 
