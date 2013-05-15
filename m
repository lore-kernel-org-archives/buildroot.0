From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 15 May 2013 10:11:03 +0200
Subject: [Buildroot] [PATCH 2/2] graph-depends: fix program path in comment
In-Reply-To: <1368605463-20677-1-git-send-email-luca@lucaceresoli.net>
References: <1368605463-20677-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1368605463-20677-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/scripts/graph-depends |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 8d81969..790e24e 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -1,7 +1,7 @@
 #!/usr/bin/python
 
 # Usage (the graphviz package must be installed in your distribution)
-#  ./scripts/graph-depends [package-name] > test.dot
+#  ./support/scripts/graph-depends [package-name] > test.dot
 #  dot -Tpdf test.dot -o test.pdf
 #
 # With no arguments, graph-depends will draw a complete graph of
-- 
1.7.10.4
