From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:12 +0200
Subject: [Buildroot] [PATCH 38/53] board/csky: remove host/usr reference
	from readme.txt
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-39-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/csky/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/csky/readme.txt b/board/csky/readme.txt
index daf7185910..b4605c541e 100644
--- a/board/csky/readme.txt
+++ b/board/csky/readme.txt
@@ -84,5 +84,5 @@ Run
   Setup the Console with the rate 115200/8-N-1.
 
   $ cd output/images
-  $ ../host/usr/bin/csky-linux-gdb -x ../../board/csky/gx6605s/gdbinit vmlinux
+  $ ../host/bin/csky-linux-gdb -x ../../board/csky/gx6605s/gdbinit vmlinux
 
-- 
2.11.0
