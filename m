From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Mar 2014 22:02:45 +0100
Subject: [Buildroot] [git commit] docs/index.html: make recent git/email
	headers links to cgit/gmane
Message-ID: <20140316210402.5F05E9BFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca823175937126b0116b9a9d8d79ffed3e8e1def
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So it is easy to start browsing directly from the homepage.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/index.html |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/index.html b/docs/index.html
index a569bee..c1eadfb 100644
--- a/docs/index.html
+++ b/docs/index.html
@@ -23,10 +23,10 @@
 
 <div class="row" style="line-height: 17px;">
   <div class="span6" id="commit-activity">
-    <h2>Recent commits</h2>
+    <a href="http://git.buildroot.net/buildroot"><h2>Recent commits</h2></a>
   </div>
   <div class="span6" id="mailing-list-activity">
-    <h2>Recent discussions</h2>
+    <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot"><h2>Recent discussions</h2></a>
   </div>
 </div>
 
