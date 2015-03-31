From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 00:00:07 +0200
Subject: [Buildroot] [git commit] docs/manual: document new graph-depends
	options
Message-ID: <20150331220030.7FC2B7F980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d1919ab4a33c5248ee7d169732d28a34e9974c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Francois Perrad <fperrad@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/common-usage.txt |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 89cd9fe..5b27b1f 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -208,6 +208,14 @@ The +graph-depends+ behaviour can be controlled by setting options in the
 * +--depth N+, +-d N+, to limit the dependency depth to +N+ levels. The
   default, +0+, means no limit.
 
+* +--stop-on PKG+, +-s PKG+, to stop the graph on the package +PKG+.
+  +PKG+ can be an actual package name, a glob, or the keyword 'virtual'
+  (to stop on virtual packages). The package is still present on the
+  graph, but its dependencies are not.
+
+* +--exclude PKG+, +-x PKG+, like +--stop-on+, but also omits +PKG+ from
+  the graph.
+
 * +--transitive+, +--no-transitive+, to draw (or not) the transitive
   dependencies. The default is to not draw transitive dependencies.
 
