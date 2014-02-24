From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 22:40:48 +0100
Subject: [Buildroot] [git commit] common-usage.txt: adjust documentation for
	renamed BR2_GRAPH_ variables
Message-ID: <20140224214311.6EE1899B79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70d534262c0b0ee1f7fdb61802bcedaae5473b92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.txt |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 96bc513..a16b887 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -92,9 +92,9 @@ to +make+ or set in the environment:
   Note that the Buildroot download directory can also be set from the
   configuration interface, so through the Buildroot +.config+ file; this
   is the recommended way of setting it.
-* +GRAPH_ALT+, if set and non-empty, to use an alternate color-scheme in
+* +BR2_GRAPH_ALT+, if set and non-empty, to use an alternate color-scheme in
   build-time graphs
-* +GRAPH_OUT+ to set the filetype of generated graphs, either +pdf+ (the
+* +BR2_GRAPH_OUT+ to set the filetype of generated graphs, either +pdf+ (the
   default), or +png+.
 
 An example that uses config files located in the toplevel directory and
@@ -193,13 +193,13 @@ system to use this feature. In most distributions, it is available as
 the +graphviz+ package.
 
 By default, the dependency graphs are generated in the PDF
-format. However, by passing the +GRAPH_OUT+ environment variable, you
+format. However, by passing the +BR2_GRAPH_OUT+ environment variable, you
 can switch to other output formats, such as PNG, PostScript or
 SVG. All formats supported by the +-T+ option of the +dot+ tool are
 supported.
 
 --------------------------------
-GRAPH_OUT=svg make graph-depends
+BR2_GRAPH_OUT=svg make graph-depends
 --------------------------------
 
 Graphing the build duration
@@ -242,9 +242,9 @@ Python version older than 2.7 (+python-argparse+ on most
 distributions).
 
 By default, the output format for the graph is PDF, but a different
-format can be selected using the +GRAPH_OUT+ environment variable. The
+format can be selected using the +BR2_GRAPH_OUT+ environment variable. The
 only other format supported is PNG:
 
 ----------------
-GRAPH_OUT=png make graph-build
+BR2_GRAPH_OUT=png make graph-build
 ----------------
