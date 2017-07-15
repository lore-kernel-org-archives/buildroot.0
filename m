From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 15 Jul 2017 12:51:35 +0200
Subject: [Buildroot] [PATCH] docs/website/support: clarify the bugtracker is
	for bugs only
Message-ID: <1500115895-14203-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bugtracker is intended to be used for bug reports only, so clarify
it's not meant to be used for "any problem".

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/website/support.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index a1184c8b673f..23a5db794f95 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -72,7 +72,7 @@
 		  <img class="img-responsive" src="images/bug-buddy.png" style="max-width:50px; margin-bottom:10px;">
 		</div>
 		<div class="col-sm-11">
-		  <p>If you encounter any problem while using Buildroot, you can use the
+		  <p>If you think you found a bug in Buildroot, you can use the
 		    <a href="https://bugs.buildroot.org/">Bug Tracker</a> to post your bugs and/or
 		    participate to find solutions to existing problems.</p>
 
-- 
2.7.4
