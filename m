From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 20:56:21 +0200
Subject: [Buildroot] [git commit] manual: document BR2_GRAPH_DEPTH
Message-ID: <20140414201322.6D31699371@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb068823abc8e3ff89776a0d0636ba3800a031b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/common-usage.txt |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index d9de598..c9d5eb9 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -96,6 +96,8 @@ to +make+ or set in the environment:
   build-time graphs
 * +BR2_GRAPH_OUT+ to set the filetype of generated graphs, either +pdf+ (the
   default), or +png+.
+* +BR2_GRAPH_DEPTH+ (an integer) to limit the depth of the dependency graph.
+  The default, +0+, is to not limit the depth.
 
 An example that uses config files located in the toplevel directory and
 in your $HOME:
