From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 15:42:32 +0100
Subject: [Buildroot] [PATCH 6/7] docs/manual: mention Java-related optional
	dependencies
In-Reply-To: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1356792153-24033-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/prerequisite.txt |    5 +++++
 1 file changed, 5 insertions(+)

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
-- 
1.7.9.5
