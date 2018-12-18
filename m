From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Wed, 19 Dec 2018 03:42:14 +0800
Subject: [Buildroot] [PATCH 1/1] docs/website: consolidate CDN's and enable
 SRI
Message-ID: <1545162134-9340-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/website/footer.html | 6 +++---
 docs/website/header.html | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/website/footer.html b/docs/website/footer.html
index 2811fc5..5b18047 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,6 +1,6 @@
-	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
-	<script src="https://oss.maxcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
-	<script src="https://cdn.rawgit.com/zenorocha/clipboard.js/v1.7.1/dist/clipboard.min.js"></script>
+	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
+	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha256-U5ZEeKfGNOja007MMD3YBI0A3OSZOQbeG6z2f2Y0hu8=" crossorigin="anonymous"></script>
+	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
 	<script type="text/javascript" src="js/buildroot.js"></script>
 </body>
 </html>
diff --git a/docs/website/header.html b/docs/website/header.html
index ef6724f..4e284a7 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -10,12 +10,12 @@
 
 	<title>Buildroot - Making Embedded Linux Easy</title>
 
-	<link href="https://oss.maxcdn.com/bootswatch/3.3.7/paper/bootstrap.min.css" rel="stylesheet">
+	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-916EbMg70RQy9LHiGkXzG8hSg9EdNy97GazNG/aiY1w=" crossorigin="anonymous">
 	<link href="css/main.css" rel="stylesheet">
 
 	<!--[if lt IE 9]>
-	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
-	  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
+	  <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha256-jHqcBHBWM2erADB7T7m7MFLQon8LlOY7ncC7jDaUScs=" crossorigin="anonymous"></script>
+	  <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.3.0/respond.min.js" integrity="sha256-g2lnLPqUkGXj7GDW+Zy47+O2ph+Ur1cmtdklVqkj+kg=" crossorigin="anonymous"></script>
 	<![endif]-->
 </head>
 
-- 
2.7.4
