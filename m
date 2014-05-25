From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 May 2014 21:46:51 +0200
Subject: [Buildroot] [git commit] website: remove remaining references to
	uclibc.org
Message-ID: <20140525204125.9F29C9CD68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03aea68f17614c103b793d3ec6014a99d851622b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The website still used some uclibc.org URLs which can now use buildroot.org.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/docs.html       |    2 +-
 docs/js/buildroot.js |    2 +-
 docs/support.html    |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/docs.html b/docs/docs.html
index 77047b9..9ddc059 100644
--- a/docs/docs.html
+++ b/docs/docs.html
@@ -34,7 +34,7 @@ help:</p>
   <li>On the <a href="irc://freenode.net/#buildroot">Buildroot IRC
   channel</a>, <code>#buildroot</code> on Freenode</li>
 
-  <li>On our <a href="https://bugs.uclibc.org">bugtracker</a>.</li>
+  <li>On our <a href="https://bugs.buildroot.org">bugtracker</a>.</li>
 
   <li>Through the various companies offering commercial Buildroot
   support.</li>
diff --git a/docs/js/buildroot.js b/docs/js/buildroot.js
index 410b703..55e5eb3 100644
--- a/docs/js/buildroot.js
+++ b/docs/js/buildroot.js
@@ -36,7 +36,7 @@ function load_activity(feedurl, divid) {
 
 function initialize() {
   load_activity("http://rss.gmane.org/topics/excerpts/gmane.comp.lib.uclibc.buildroot", "mailing-list-activity");
-  load_activity("http://git.uclibc.org/buildroot/atom/?h=master", "commit-activity");
+  load_activity("http://git.buildroot.org/buildroot/atom/?h=master", "commit-activity");
 }
 
 function google_analytics() {
diff --git a/docs/support.html b/docs/support.html
index 4cc4932..70f5829 100644
--- a/docs/support.html
+++ b/docs/support.html
@@ -37,7 +37,7 @@ list with frequently asked questions...
 
 <h3>Bug Tracker</h3>
 
-If you encounter any problems while using Buildroot, you can use the <a href="https://bugs.uclibc.org/">Bug Tracker</a>
+If you encounter any problems while using Buildroot, you can use the <a href="https://bugs.buildroot.org/">Bug Tracker</a>
 to post your bugs and/or participate to find solutions to existing problems.
 
 Note: Patch are only accepted through the mailing list.
