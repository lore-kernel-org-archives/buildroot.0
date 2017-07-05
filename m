From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 13:14:37 +0200
Subject: [Buildroot] [PATCH v4 20/36] board/gdb/bfin-bf512: remove host/usr
	reference from readme.txt
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705111453.2284-21-arnout@mind.be>
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
2.13.2
