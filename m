From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 24 May 2014 22:06:49 +0200
Subject: [Buildroot] [PATCH 2 of 4 v2 for-2014.05] website: remove remaining
 references to uclibc.org
In-Reply-To: <patchbomb.1400962007@argentina>
References: <patchbomb.1400962007@argentina>
Message-ID: <1e6e3e4e5acfcd44d44b.1400962009@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The website still used some uclibc.org URLs which can now use buildroot.org.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
v2: no changes

 docs/docs.html       |  2 +-
 docs/js/buildroot.js |  2 +-
 docs/support.html    |  2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

Note: the news.html page still uses bugs.uclibc.org instead of
bugs.buildroot.org, which I was hesitant to change ("you can't rewrite the
past"). However, I would like to request Peter if upcoming release
announcements could start using bugs.buildroot.org instead...

Note2: Yann's comment on this patch has been integrated in the next patch,
along with some other changes

diff --git a/docs/docs.html b/docs/docs.html
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
--- a/docs/support.html
+++ b/docs/support.html
@@ -37,7 +37,7 @@ list with frequently asked questions...
 
 <h3>Bug Tracker</h3>
 
-If you encounter any problems while using Buildroot, you can use the <a href="https://bugs.uclibc.org/">Bug Tracker</a>
+If you encounter any problems while using Buildroot, you can use the <a href="https://bugs.buildroot.org/">Bug Tracker</a>
 to post your bugs and/or participate to find solutions to existing problems.
 
 Note: Patch are only accepted through the mailing list.
