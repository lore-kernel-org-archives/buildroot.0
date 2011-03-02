From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Mar 2011 11:56:03 +0100
Subject: [Buildroot] [git commit master 1/1] website: add google analytics
	for statistics
Message-ID: <20110302105645.31BA48B635@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=26ca282bc94d84fe705f48f3231035484ac9c6f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/header.html |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/docs/header.html b/docs/header.html
index beb85e9..c8cb135 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -15,6 +15,21 @@
      td.c2 {font-family: arial, helvetica, sans-serif; font-size: 80%}
      td.c1 {font-family: lucida, helvetica; font-size: 248%}
     </style>
+<script type="text/javascript">
+
+  var _gaq = _gaq || [];
+  _gaq.push(['_setAccount', 'UA-21761074-1']);
+  _gaq.push(['_setDomainName', 'none']);
+  _gaq.push(['_setAllowLinker', true]);
+  _gaq.push(['_trackPageview']);
+
+  (function() {
+    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
+    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
+    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
+  })();
+
+</script>
   </head>
 
   <body>
-- 
1.7.3.4
