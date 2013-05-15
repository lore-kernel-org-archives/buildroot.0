From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 15 May 2013 16:04:48 +0200
Subject: [Buildroot] [git commit] graph-depends: fix program path in comment
Message-ID: <20130515140652.1373D9A214@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13c367f827566c91e4a85fb5d050424904f404ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/graph-depends |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
