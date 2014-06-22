From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:14:52 +0200
Subject: [Buildroot] [git commit] manual: add requirements for graph
	generation
Message-ID: <20140622171522.0F1A89D06D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87a58345ad06c227f1d3a528690ded2216fd04df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add "graphviz" and "python-matplotlib" as requirements for graph
generation.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reported-by: Dallas Clement <dallas.a.clement@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/prerequisite.txt |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index c5d5442..30970d2 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -77,3 +77,7 @@ development context (further details: refer to xref:download-infra[]).
 ** +w3m+
 ** +python+ with the +argparse+ module (automatically present in 2.7+ and 3.2+)
 ** +dblatex+ (required for the pdf manual only)
+
+* Graph generation tools:
+** +graphviz+ to use 'graph-depends' and '<pkg>-graph-depends'
+** +python-matplotlib+ to use 'graph-build'
