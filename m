From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 21:29:38 +0100
Subject: [Buildroot] [git commit] docs/manual: update graph-depends
	documentation about --stop-on
Message-ID: <20160208213711.CB6958182E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44beb463371ab30ec5a0d6423cc2d358ec7fa24f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit updates the graph-depends documentation to take into
account the new 'host' keyword that can be passed to the --stop-on and
--exclude options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/common-usage.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 18677b8..7602260 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -212,9 +212,10 @@ The +graph-depends+ behaviour can be controlled by setting options in the
   default, +0+, means no limit.
 
 * +--stop-on PKG+, +-s PKG+, to stop the graph on the package +PKG+.
-  +PKG+ can be an actual package name, a glob, or the keyword 'virtual'
-  (to stop on virtual packages). The package is still present on the
-  graph, but its dependencies are not.
+  +PKG+ can be an actual package name, a glob, the keyword 'virtual'
+  (to stop on virtual packages), or the keyword 'host' (to stop on
+  host packages). The package is still present on the graph, but its
+  dependencies are not.
 
 * +--exclude PKG+, +-x PKG+, like +--stop-on+, but also omits +PKG+ from
   the graph.
