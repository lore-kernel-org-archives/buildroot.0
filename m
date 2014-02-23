From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 22:30:14 +0100
Subject: [Buildroot] [git commit] docs/manual: mention the per-package
	graph-depends target
Message-ID: <20140223213139.6CDCB9B78F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7cbb476661b0cfa213d8885f3fe5d58823e84286
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/package-make-target.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index 9eefe68..bd514f4 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -63,6 +63,11 @@ Additionally, there are some other useful make targets:
 | +show-depends+    | Displays the dependencies required to build the
 package
 
+| +graph-depends+   | Generate a dependency graph of the package, in the
+context of the current Buildroot configuration. See
+xref:graph-depends[this section] for more details about dependency
+graphs.
+
 | +dirclean+        | Remove the whole package build directory
 
 | +rebuild+         | Re-run the compilation commands - this only makes
