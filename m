From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 May 2014 21:45:02 +0200
Subject: [Buildroot] [git commit] website: rework Contribute page to avoid
	duplication with manual
Message-ID: <20140525204125.969F09CDBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=397e022ca4eafbc2c01fccf7f71c9c5567b32abc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual contains details about how users can contribute to
buildroot. The website also had such a list, but with much less detail and
not containing all topics.
In order to avoid duplicating this information, simply list the different
topics without detail on the website, and add a link to the relevent
chapter of the manual.

[Peter: slightly reword]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/contribute.html |   59 ++++++++++++++++++++++----------------------------
 1 files changed, 26 insertions(+), 33 deletions(-)

diff --git a/docs/contribute.html b/docs/contribute.html
index 1a2042d..91959f8 100644
--- a/docs/contribute.html
+++ b/docs/contribute.html
@@ -2,38 +2,31 @@
 
 <h2>Contribute</h2>
 
-Buildroot is an open source project and if you want to contribute, here a few
-pointers to get you started.
-
-<p>Don't forget to look at <a href="./support.html">Support</a> if you need any
-help.
-And thanks for your help !</p>
-
-<h3>Autobuilders</h3>
-
-The <a href="http://autobuild.buildroot.org/">Autobuilders</a> are used to test
-Buildroot with a lot of differents settings (toolchains, various packages, etc)
-on all the supported platforms.
-
-<p>But despite our best effort, sometimes it fails.</p>
-<p>That's where you can help ! Look at a package that fails and try to fix it !</p>
-
-<h3>Wiki</h3>
-
-Have a look at the <a href="http://elinux.org/Buildroot">eLinux Wiki</a> a todo
-list is available there, which can help you find out what you could do to help
-Buildroot.
-
-<h3>Patchwork</h3>
-
-<a href="http://patchwork.ozlabs.org/project/buildroot/list/">Patchwork</a>
-is a patch tracking system, if you submit a patch, it will appear here.
-
-<p>You can have a look at a patch that interests you and test it on your machine,
-if it succeeds, you can send a <a
-  href="http://buildroot.org/downloads/manual/manual.html#_reviewing_testing_patches">"Tested-by"</a>,
-if it fails, you can also send a mail on the <a
-  href="http://buildroot.org/downloads/manual/manual.html#_mailing_list">mailing
-  list</a> and report what has happened to you.</p>
+<p>Buildroot is an open source project and you are very welcome to contribute to
+it.<br />
+There are many different ways to contribute:</p>
+
+<ul>
+<li>Reproducing, analyzing and fixing bugs from our
+    <a href="https://bugs.buildroot.org/">bug tracker</a></li>
+<li>Analyzing and fixing <a href="http://autobuild.buildroot.org/">
+    autobuild failures</a></li>
+<li>Reviewing and testing patches sent by other developers. See the
+    <a href="http://lists.busybox.net/mailman/listinfo/buildroot">mailing list
+    </a> or <a href="http://patchwork.ozlabs.org/project/buildroot/list/">
+    patchwork</a>.</li>
+<li>Working on items from the
+    <a href="http://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
+<li>Submitting your own patches through the
+    <a href="http://lists.busybox.net/mailman/listinfo/buildroot">mailing list
+    </a></li>
+</ul>
+
+<p>For more details on these topics, check out the
+<a href="http://buildroot.uclibc.org/downloads/manual/manual.html#_contributing_to_buildroot">
+Contributing to buildroot</a> chapter in the Buildroot manual. Thanks for your help!</p>
+
+<p>If you need any support yourself, have a look at <a href="./support.html">
+Support</a>.</p>
 
 <!--#include file="footer.html" -->
