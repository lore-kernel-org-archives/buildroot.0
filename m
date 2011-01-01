From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 1 Jan 2011 11:49:01 +0100
Subject: [Buildroot] [git commit master 1/1] bison: remove unused yacc
	wrapper
Message-ID: <20110101113506.C0AA68F2F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6bdaee1e0fd76c0201e8ec18b241b21cd9dc593a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No longer used since 98611b (bison: convert to the autotools infrastructure)

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bison/yacc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)
 delete mode 100755 package/bison/yacc

diff --git a/package/bison/yacc b/package/bison/yacc
deleted file mode 100755
index aed120e..0000000
--- a/package/bison/yacc
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-exec /usr/bin/bison -y "$@"
-- 
1.7.2.2
