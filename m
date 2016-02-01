From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 14:25:15 +0100
Subject: [Buildroot] [git commit] manual: minor fixes in the graph-size
	documentation
Message-ID: <20160201224659.7C61B80431@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcddb9dafed7cc84318838c98ebf8bac38369714
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix some typos and references to a size-stats 'target' (the script is called
'size-stats' but the make target is 'graph-size').

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/common-usage.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index bca99f4..8d0ba63 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -282,7 +282,7 @@ When your target system grows, it is sometimes useful to understand
 how much each Buildroot package is contributing to the overall root
 filesystem size. To help with such an analysis, Buildroot collects
 data about files installed by each package and using this data,
-generates a graph and CSVs files detailing the size contribution of
+generates a graph and CSV files detailing the size contribution of
 the different packages.
 
 To generate these data after a build, run:
@@ -303,9 +303,9 @@ This will generate:
   contribution of each installed file to the package it belongs, and
   to the overall filesystem size.
 
-This +size-stats+ target requires the Python Matplotlib library to be
+This +graph-size+ target requires the Python Matplotlib library to be
 installed (+python-matplotlib+ on most distributions), and also the
-+argpase+ module if you're using a Python version older than 2.7
++argparse+ module if you're using a Python version older than 2.7
 (+python-argparse+ on most distributions).
 
 Just like for the duration graph, a +BR2_GRAPH_OUT+ environment is
@@ -315,7 +315,7 @@ for details about this environment variable.
 .Note
 The collected filesystem size data is only meaningful after a complete
 clean rebuild. Be sure to run +make clean all+ before using +make
-size-stats+.
+graph-size+.
 
 include::eclipse-integration.txt[]
 
