From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 15:26:28 +0200
Subject: [Buildroot] [PATCH 2/2] Rephrase and extend the documentation page
In-Reply-To: <cover.1274448358.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274448358.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b633c9600a5acda7eb6275d9274a56bc12fe4e92.1274448358.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/docs.html |   49 +++++++++++++++++++++++--------------------------
 1 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/docs/docs.html b/docs/docs.html
index 663135a..57f4bf6 100644
--- a/docs/docs.html
+++ b/docs/docs.html
@@ -1,35 +1,32 @@
 <!--#include file="header.html" -->
 
-
 <h3>Documentation</h3>
-Documentation for buildroot includes:
+
+<p>Our document "Buildroot usage and documentation" is where you want
+to start reading if you wish to understand how Buildroot work, or wish
+to change/extend/fix things. If you find any errors (factual,
+grammatical, whatever) please report them. Choose between:</p>
 
 <ul>
+  <li><a href="/downloads/buildroot.html">Latest stable release</a></li>
+  <li><a href="buildroot.html">GIT head revision</a></li>
+</ul>
+
+<p>If you find that you need help with Buildroot, you can ask for
+help:</p>
+
+<ul>
+
+  <li>On the <a href="lists.html">buildroot mailing list</a>
+  at <code>buildroot at uclibc.org</code></li>
+
+  <li>On the <a href="irc://freenode.net/#uclibc">Buildroot IRC
+  channel</a>, <code>#uclibc</code> on Freenode</li>
+
+  <li>On our <a href="https://bugs.uclibc.org">bugtracker</a>.</li>
 
-  <li>
-    Usage and documentation is where you want to start reading if you
-    wish to understand how buildroot work, or wish to
-    change/extend/fix things. If you find any errors (factual,
-    grammatical, whatever) please report them. Choose between:
-    <p>
-    <ul>
-      <li><a href="/downloads/buildroot.html">Latest stable release</a></li>
-      <li><a href="buildroot.html">GIT head revision</a></li>
-    </ul>
-    <p>
-  </li>
-
-  <li>
-    <a href="README">README</a>. This is the README file included in the
-    buildroot source release.
-  </li>
-
-  <li>
-    If you find that you need help with buildroot, you can ask for help on the
-    <a href= "lists.html">buildroot mailing list</a> at buildroot at uclibc.org.
-    In addition the BusyBox, uClibc, and buildroot developers are also known to
-    hang out on the uClibc IRC channel: #uclibc on irc.freenode.net.
-  </li>
+  <li>Through the various companies offering commercial Buildroot
+  support.</li>
 
 </ul>
 
-- 
1.6.3.3
