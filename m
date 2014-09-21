From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:20:02 +0200
Subject: [Buildroot] [git commit] docs: move Buildroot CSS code into its own
	file
Message-ID: <20140921192111.C710B9D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c903d70b807648f0e285ab909662ab60a690ed8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation to the addition of more CSS code, this commit moves the
Buildroot site specific CSS code from header.html to a dedicated CSS
file.

[Thomas: add missing space before opening curly brace, as suggested by
Thomas DS.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 docs/css/buildroot.css |   13 +++++++++++++
 docs/header.html       |   12 +-----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/docs/css/buildroot.css b/docs/css/buildroot.css
new file mode 100644
index 0000000..86a9c77
--- /dev/null
+++ b/docs/css/buildroot.css
@@ -0,0 +1,13 @@
+body {
+    padding-top: 60px;
+    padding-bottom: 40px;
+}
+
+.button_column {
+    width: 430px;
+}
+
+.gplus {
+    float:right;
+    margin: 10px 0 0;
+}
diff --git a/docs/header.html b/docs/header.html
index c1eba22..f37759e 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -7,19 +7,9 @@
     <meta name="author" content="The Buildroot developers">
     <link rel="shortcut icon" href="favicon.ico">
     <link href="css/bootstrap.min.css" rel="stylesheet">
+    <link href="css/buildroot.css" rel="stylesheet">
 
     <style type="text/css">
-      body {
-      padding-top: 60px;
-      padding-bottom: 40px;
-      }
-      .button_column{
-        width: 430px;
-      }
-      .gplus {
-        float:right;
-        margin: 10px 0 0;
-      }
     </style>
 
     <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
