From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 May 2014 21:48:01 +0200
Subject: [Buildroot] [git commit] website: fix typos and HTML on support page
Message-ID: <20140525204125.A5E9A9CDAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97a632a0b2d01ab6c6c567103d599941a9ce17c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a few typos on the support page, and add correct HTML <p> </p> tag
pairs.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/support.html |   32 ++++++++++++++++----------------
 1 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/docs/support.html b/docs/support.html
index 70f5829..5fa3cde 100644
--- a/docs/support.html
+++ b/docs/support.html
@@ -2,32 +2,31 @@
 
 <h2>Support</h2>
 
-You can get support for Buildroot through three main channels:
+<p>You can get support for Buildroot through three main channels:</p>
 
 <h3>IRC</h3>
-The Buildroot IRC is <a href="irc://freenode.net/#buildroot">#buildroot</a>.
-The channel #buildroot is hosted on Freenode <a href="http://webchat.freenode.net">WebChat</a>.
-
+<p>The Buildroot IRC channel is <a href="irc://freenode.net/#buildroot">
+#buildroot</a>, hosted on Freenode. If you do not have an IRC client, you can
+use the <a href="http://webchat.freenode.net">Freenode web interface</a>.
 When asking for help on IRC, share relevant logs or pieces of code using a code
-sharing website.
+sharing website.</p>
 
 <h3>Mailing List Information</h3>
-The <a href="/lists/buildroot/">mailing list</a> is for discussion and
+<p>The <a href="/lists/buildroot/">mailing list</a> is for discussion and
 development.  You can subscribe by visiting
 <a href="http://lists.busybox.net/mailman/listinfo/buildroot">this page</a>.
 Only subscribers to the Buildroot mailing list are allowed to post
-to this list.
-<p>
-The list is also available through <a
+to this list.</p>
+
+<p>The list is also available through <a
 href="http://gmane.org">Gmane</a> at <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot">gmane.comp.lib.uclibc.buildroot</a>.
-<p>
+</p>
 
 <h4>Search the List Archives</h4>
-Please search the mailing list archives before asking questions on the mailing
+<p>Please search the mailing list archives before asking questions on the mailing
 list, since there is a good chance someone else has asked the same question
 before.  Checking the archives is a great way to avoid annoying everyone on the
-list with frequently asked questions...
-<p>
+list with frequently asked questions...</p>
 
 <form method="get" action="http://search.gmane.org/">
   <input type="text" name="query">
@@ -37,9 +36,10 @@ list with frequently asked questions...
 
 <h3>Bug Tracker</h3>
 
-If you encounter any problems while using Buildroot, you can use the <a href="https://bugs.buildroot.org/">Bug Tracker</a>
-to post your bugs and/or participate to find solutions to existing problems.
+<p>If you encounter any problem while using Buildroot, you can use the
+<a href="https://bugs.buildroot.org/">Bug Tracker</a> to post your bugs and/or
+participate to find solutions to existing problems.</p>
 
-Note: Patch are only accepted through the mailing list.
+<p>Note: patches are only accepted through the mailing list.</p>
 
 <!--#include file="footer.html" -->
