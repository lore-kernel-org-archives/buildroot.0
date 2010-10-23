From: Martin Banky <martin.banky@gmail.com>
Date: Sat, 23 Oct 2010 14:53:08 +0200
Subject: [Buildroot] [git commit master 1/1] stylesheet.css: cleaned up css
	code
Message-ID: <20101023143215.1F24B8D3C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a454cb61c075f19bc34ca98fd4ec692593af0d9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed indents, and removed redundent specifers and trailing spaces.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/stylesheet.css |   54 +++++++++++++++++++++++++-------------------------
 1 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/docs/stylesheet.css b/docs/stylesheet.css
index ac938c5..0feb32e 100644
--- a/docs/stylesheet.css
+++ b/docs/stylesheet.css
@@ -1,13 +1,13 @@
 body {
-	margin: 0px 0px 0px 0px;
+	margin: 0px;
 	color: white;
 	background-color: #93c6f9;
 	font: 12pt/18pt georgia;
 }
 
 div.main {
-	margin: 10px 10px 10px 10px;
-	padding: 10px 10px 10px 10px;
+	margin: 10px;
+	padding: 10px;
 	color: black;
 	background-color: white;
 }
@@ -16,49 +16,49 @@ div.titre {
 	text-align: center;
 	background-color: #336699;
 	color: white;
-	padding: 10px 10px 10px 10px;
+	padding: 10px;
 }
 
 h1 {
 	text-align: center;
-	font: 26pt georgia; 
-	letter-spacing: 3px; 
+	font: 26pt georgia;
+	letter-spacing: 3px;
 }
 
 h2 {
-	padding: 5px 5px 5px 5px;
+	padding: 5px;
 	background-color: #c2e0ff;
 	color: #336699;
 }
 
-a:link, a:visited { 
-	font-weight: bold; 
-	text-decoration: none; 
+a:link, a:visited {
+	font-weight: bold;
+	text-decoration: none;
 	color: #336699;
 }
 
-a:hover, a:active { 
-	text-decoration: underline; 
+a:hover, a:active {
+	text-decoration: underline;
 	color: #9685BA;
 }
 
-h3 { 
-	font: italic normal 14pt georgia; 
-	letter-spacing: 1px; 
-	margin-bottom: 0px; 
+h3 {
+	font: italic normal 14pt georgia;
+	letter-spacing: 1px;
+	margin-bottom: 0px;
 	margin-left: 10px;
 	margin-right: 10px;
 	color: #336699;
-        border-bottom: 2px solid #336699;
+	border-bottom: 2px solid #336699;
 }
 
-h4 { 
-	font: italic normal 14pt georgia; 
-	letter-spacing: 1px; 
-	margin-bottom: 0px; 
+h4 {
+	font: italic normal 14pt georgia;
+	letter-spacing: 1px;
+	margin-bottom: 0px;
 	margin-left: 10px;
 	margin-right: 10px;
-        border-bottom: 1px dashed black;
+	border-bottom: 1px dashed black;
 }
 
 p {
@@ -68,8 +68,8 @@ p {
 }
 
 pre {
-  border-left: 3px #aaa solid;
-  margin-left: 1em;
-  padding: 0 1em;
-  color: #888;
-}
\ No newline at end of file
+	border-left: 3px #aaa solid;
+	margin-left: 1em;
+	padding: 0 1em;
+	color: #888;
+}
-- 
1.7.1
