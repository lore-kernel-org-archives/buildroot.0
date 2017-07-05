From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:36 +0200
Subject: [Buildroot] [git commit] board/csky: remove host/usr reference from
	readme.txt
Message-ID: <20170705141336.97BF181D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6999e61394ba06fd05565f6b8fda9a13c464f884
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/csky/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/csky/readme.txt b/board/csky/readme.txt
index daf7185..b4605c5 100644
--- a/board/csky/readme.txt
+++ b/board/csky/readme.txt
@@ -84,5 +84,5 @@ Run
   Setup the Console with the rate 115200/8-N-1.
 
   $ cd output/images
-  $ ../host/usr/bin/csky-linux-gdb -x ../../board/csky/gx6605s/gdbinit vmlinux
+  $ ../host/bin/csky-linux-gdb -x ../../board/csky/gx6605s/gdbinit vmlinux
 
