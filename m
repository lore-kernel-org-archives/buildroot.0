From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:11 +0200
Subject: [Buildroot] [PATCH 37/53] board/gdb/bfin-bf512: remove host/usr
	reference from readme.txt
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-38-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/gdb/bfin-bf512/readme.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/gdb/bfin-bf512/readme.txt b/board/gdb/bfin-bf512/readme.txt
index a56b5bcfe9..b8ff250a04 100644
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
 
-- 
2.11.0
