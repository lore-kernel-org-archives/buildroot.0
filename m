From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 29 Dec 2015 21:53:25 +0100
Subject: [Buildroot] [PATCH] docs/website: fixing pre block indentation
Message-ID: <1451422405-18339-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pre block should not be indented, this patch fixes wrong
indentation.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/download.html | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 46f601d..34b06bf 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -137,9 +137,9 @@
 		tree at any time so it is in sync with the latest and greatest by entering your
 		buildroot directory and running the command:
 
-		<pre>
-		  git pull
-		</pre>
+<pre>
+git pull
+</pre>
 
 		Because you've only been granted anonymous access to the tree, you won't be
 		able to push your changes to the repo. Changes can instead be submitted for
-- 
1.9.1
