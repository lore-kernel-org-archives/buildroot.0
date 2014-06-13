From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 13 Jun 2014 19:06:47 +0200
Subject: [Buildroot] [PATCH 1/2] manual: add prerequisites for graph
	generation
Message-ID: <1402679208-8304-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add "graphviz" and "python-matplotlib" as prerequisites for graph
generation.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reported-by: Dallas Clement <dallas.a.clement@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/prerequisite.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index c5d5442..ffe86dd 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -77,3 +77,7 @@ development context (further details: refer to xref:download-infra[]).
 ** +w3m+
 ** +python+ with the +argparse+ module (automatically present in 2.7+ and 3.2+)
 ** +dblatex+ (required for the pdf manual only)
+
+* Graph generation tools:
+** +graphviz+
+** +python-matplotlib+ to use 'graph-build'
-- 
2.0.0
