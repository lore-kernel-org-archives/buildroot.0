From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri, 28 Nov 2014 09:25:06 -0600
Subject: [Buildroot] [PATCH v3 3/3] manual: style update
In-Reply-To: <1417188306-9035-1-git-send-email-rdkehn@yahoo.com>
References: <1417188306-9035-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1417188306-9035-4-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Align column separators.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 docs/manual/package-make-target.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index 0f0aced..35d787e 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -57,23 +57,23 @@ Additionally, there are some other useful make targets:
 
 [width="90%",cols="^1,4",options="header"]
 |===================================================
-| command/target    | Description
+| command/target      | Description
 
-| +show-depends+    | Displays the dependencies required to build the
+| +show-depends+      | Displays the dependencies required to build the
 package
 
-| +graph-depends+   | Generate a dependency graph of the package, in the
+| +graph-depends+     | Generate a dependency graph of the package, in the
 context of the current Buildroot configuration. See
 xref:graph-depends[this section] for more details about dependency
 graphs.
 
-| +dirclean+        | Remove the whole package build directory
+| +dirclean+          | Remove the whole package build directory
 
-| +rebuild+         | Re-run the compilation commands - this only makes
+| +rebuild+           | Re-run the compilation commands - this only makes
 sense when using the +OVERRIDE_SRCDIR+ feature or when you modified a file
 directly in the build directory
 
-| +reconfigure+     | Re-run the configure commands, then rebuild - this only
+| +reconfigure+       | Re-run the configure commands, then rebuild - this only
 makes sense when using the +OVERRIDE_SRCDIR+ feature or when you modified a
 file directly in the build directory
 
-- 
1.9.1
