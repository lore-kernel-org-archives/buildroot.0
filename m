From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Mon, 18 Jun 2018 14:11:49 +0200
Subject: [Buildroot] [PATCH i-g-t 1/1] docs/manual/prerequisite.txt:
Message-ID: <20180618121149.6812-1-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add required packages to be able to build on Fedora x86_64 with prebuilt x86
tools.

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
---
 docs/manual/prerequisite.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 110fab41fd..c55688bf18 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -87,3 +87,7 @@ corresponding tool on the host system:
 * Graph generation tools:
 ** +graphviz+ to use 'graph-depends' and '<pkg>-graph-depends'
 ** +python-matplotlib+ to use 'graph-build'
+
+* Building on Fedora x86_64 with x86 pre-built tools:
+** +glibc.i686+
+** +zlib.i686+
-- 
2.13.6
