From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Dec 2012 22:42:38 +0100
Subject: [Buildroot] [git commit] docs/manual: mention Java-related optional
	dependencies
Message-ID: <20121229214338.DF0959A52D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=961cc7a497b6d3eba422b6a05c442d864ab65a60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/prerequisite.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index b8bc906..21e4627 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -74,5 +74,10 @@ development context (further details: refer to xref:download-infra[]).
 ** +qt4+ to use the 'xconfig' interface
 ** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
 
+* Java-related packages, if the Java Classpath needs to be built for
+  the target system:
+** The +javac+ compiler
+** The +jar+ tool
+
 * Documentation generation tools:
 ** +asciidoc+
