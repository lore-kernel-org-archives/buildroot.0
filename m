From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 14:50:40 +0200
Subject: [Buildroot] [git commit] docs: use lists.buildroot.org to refer to
	the mailman archives
Message-ID: <20150914125247.7065281E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e77d6c60b98893f2075d9baa5778216ffb0be9ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that mailman handles lists.buildroot.org lets use that everywhere in the
documentation as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/resources.txt    |    4 +-
 docs/website/contribute.html |    4 +-
 docs/website/news.html       |   90 +++++++++++++++++++++---------------------
 docs/website/support.html    |    2 +-
 4 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/docs/manual/resources.txt b/docs/manual/resources.txt
index d2d815e..69bfff8 100644
--- a/docs/manual/resources.txt
+++ b/docs/manual/resources.txt
@@ -17,11 +17,11 @@ main method of interaction for Buildroot users and developers.
 +
 Only subscribers to the Buildroot mailing list are allowed to post to
 this list. You can subscribe via the
-http://lists.busybox.net/mailman/listinfo/buildroot[mailing list info
+http://lists.buildroot.org/mailman/listinfo/buildroot[mailing list info
 page].
 +
 Mails that are sent to the mailing list are also available in the
-http://lists.busybox.net/pipermail/buildroot[mailing list archives] and
+http://lists.buildroot.org/pipermail/buildroot[mailing list archives] and
 via http://gmane.org[Gmane], at
 http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot[+gmane.comp.lib.uclibc.buildroot+].
 Please search the mailing list archives before asking questions, since
diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index c68a8a7..f9fdec6 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -15,13 +15,13 @@ There are many different ways to contribute:</p>
 <li>Analyzing and fixing <a href="http://autobuild.buildroot.org/">
     autobuild failures</a></li>
 <li>Reviewing and testing patches sent by other developers. See the
-    <a href="http://lists.busybox.net/mailman/listinfo/buildroot">mailing list
+    <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
     </a> or <a href="http://patchwork.ozlabs.org/project/buildroot/list/">
     patchwork</a>.</li>
 <li>Working on items from the
     <a href="http://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
 <li>Submitting your own patches through the
-    <a href="http://lists.busybox.net/mailman/listinfo/buildroot">mailing list
+    <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
     </a></li>
 </ul>
 
diff --git a/docs/website/news.html b/docs/website/news.html
index aeb0223..2a10a07 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -34,7 +34,7 @@
     tree, see
     the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08-rc2">CHANGES</a>
     file for details, and
-    the <a href="http://lists.busybox.net/pipermail/buildroot/2015-August/137879.html">release
+    the <a href="http://lists.buildroot.org/pipermail/buildroot/2015-August/137879.html">release
     announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
@@ -49,7 +49,7 @@
     tree, see
     the <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.08-rc1">CHANGES</a>
     file for details, read
-    the <a href="http://lists.busybox.net/pipermail/buildroot/2015-August/135417.html">announcement</a>.</p>
+    the <a href="http://lists.buildroot.org/pipermail/buildroot/2015-August/135417.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2015.08-rc1.tar.bz2">2015.08-rc1
@@ -63,7 +63,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2015-May/129209.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2015-May/129209.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2015.05.tar.bz2">2015.05 release</a>.</p>
 
@@ -98,7 +98,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05-rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2015-May/127794.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2015-May/127794.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2015.05-rc1.tar.bz2">2015.05-rc1
@@ -112,7 +112,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2015-March/120396.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2015-March/120396.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2015.02.tar.bz2">2015.02 release</a>.</p>
 
@@ -147,7 +147,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.02-rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2015-February/118982.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2015-February/118982.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2015.02-rc1.tar.bz2">2015.02-rc1
@@ -194,7 +194,7 @@
     <p>A report from the recent
     <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2014">
     Buildroot Developers Meeting</a> is now
-    <a href="http://lists.busybox.net/pipermail/buildroot/2014-October/109966.html">available</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2014-October/109966.html">available</a>.</p>
 
     <p>Once again, thanks to all the participants and to
     <a href="http://www.mind.be">Mind</a> for sponsoring the event.</p>
@@ -211,7 +211,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11-rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2014-November/111946.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2014-November/111946.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2014.11-rc1.tar.bz2">2014.11-rc1
@@ -225,7 +225,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2014-September/105257.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2014-September/105257.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2014.08.tar.bz2">2014.08 release</a>.</p>
 
@@ -260,7 +260,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.08-rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2014-August/103972.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2014-August/103972.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2014.08-rc1.tar.bz2">2014.08-rc1
@@ -274,7 +274,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2014-May/097863.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2014-May/097863.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2014.05.tar.bz2">2014.05 release</a>.</p>
 
@@ -309,7 +309,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.05-rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2014-May/096492.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2014-May/096492.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2014.05-rc1.tar.bz2">2014.05-rc1
@@ -357,7 +357,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.02-rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2014-February/089055.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2014-February/089055.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2014.02-rc1.tar.bz2">2014.02-rc1
@@ -370,7 +370,7 @@
     <p>A report from the recent
     <a href="http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014">
     Buildroot Developers Meeting</a> is now
-    <a href="http://lists.busybox.net/pipermail/buildroot/2014-February/088373.html">available</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2014-February/088373.html">available</a>.</p>
 
     <p>Once again, thanks to all the participants and to
     <a href="http://www.google.com">Google</a> and
@@ -399,7 +399,7 @@
     <p>The stable 2013.11 release is out - Thanks to everyone
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11">CHANGES</a>
-    file for more details, read the <a href="http://lists.busybox.net/pipermail/buildroot/2013-November/083600.html">announcement</a>
+    file for more details, read the <a href="http://lists.buildroot.org/pipermail/buildroot/2013-November/083600.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.11.tar.bz2">2013.11 release</a>.</p>
 
@@ -466,7 +466,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11_rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2013-November/082514.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2013-November/082514.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.11-rc1.tar.bz2">2013.11-rc1
@@ -479,7 +479,7 @@
     <p>A report from the recent
     <a href="http://elinux.org/Buildroot:DeveloperDaysELCE2013">
     Buildroot Developers Meeting</a> is now
-    <a href="http://lists.busybox.net/pipermail/buildroot/2013-November/082401.html">available</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2013-November/082401.html">available</a>.</p>
 
     <p>Once again, thanks to all the participants and to
     <a href="http://www.imgtec.com/">Imagination Technologies</a>
@@ -516,7 +516,7 @@
     <p>The stable 2013.08 release is out - Thanks to everyone
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08">CHANGES</a>
-    file for more details, read the <a href="http://lists.busybox.net/pipermail/buildroot/2013-August/077224.html">announcement</a>
+    file for more details, read the <a href="http://lists.buildroot.org/pipermail/buildroot/2013-August/077224.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.08.tar.bz2">2013.08 release</a>.</p>
 
@@ -565,7 +565,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2013-May/073121.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2013-May/073121.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.05.tar.bz2">2013.05 release</a>.</p>
 
@@ -601,7 +601,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05_rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2013-May/071737.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2013-May/071737.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.05-rc1.tar.bz2">2013.05-rc1
@@ -650,7 +650,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02_rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2013-February/067148.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2013-February/067148.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2013.02-rc1.tar.bz2">2013.02-rc1
@@ -661,7 +661,7 @@
   <li><b>10 February 2013 -- Report from Buildroot Developers Meeting</b>
 
     <p>A report from the recent Buildroot Developers Meeting is now
-    <a href="http://lists.busybox.net/pipermail/buildroot/2013-February/067105.html">available</a>.
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2013-February/067105.html">available</a>.
     <a href="http://emlinews.net">Embedded Linux News</a> also has a
     <a href="http://www.emlinews.net/2013/02/buildroot-developers-meeting-report/">
     writeup about the event</a>, including photos.</p>
@@ -725,7 +725,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11_rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2012-November/061995.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2012-November/061995.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.11-rc1.tar.bz2">2012.11-rc1
@@ -737,7 +737,7 @@
 
     <p>A report from the recent <i>Buildroot Developer Days</i> meeting
     in Barcelona, Spain is now <a
-    href="http://lists.busybox.net/pipermail/buildroot/2012-November/061558.html">available</a>.
+    href="http://lists.buildroot.org/pipermail/buildroot/2012-November/061558.html">available</a>.
     Many thanks to all the participants, and a special thanks to Arnout
     Vandecappelle from <a href="http://mind.be/">mind</a> for taking
     notes and Thomas Petazzoni from <a
@@ -817,7 +817,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2012-May/054342.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2012-May/054342.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.05.tar.bz2">2012.05 release</a>.</p>
 
@@ -852,7 +852,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2012-May/053736.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2012-May/053736.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.05-rc1.tar.bz2">2012.05-rc1
@@ -881,7 +881,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2012-February/050752.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2012-February/050752.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.02.tar.bz2">2012.02 release</a>.</p>
 
@@ -916,7 +916,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2012-February/050234.html">announcement</a>.</p>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2012-February/050234.html">announcement</a>.</p>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2012.02-rc1.tar.bz2">2012.02-rc1
@@ -929,7 +929,7 @@
     <p>Another <i>Buildroot Developer Day</i> will take place on
     Friday, February 3rd in Brussels, Belgium - The day before <a
     href="http://fosdem.org">FOSDEM</a>. See the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2012-January/049340.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2012-January/049340.html">announcement</a>
     or the <a href="http://free-electrons.com/blog/bdd-2012-brussels/">Free Electrons blog</a>
     for more info.</p>
 
@@ -939,7 +939,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2011-November/047926.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2011-November/047926.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.11.tar.bz2">2011.11 release</a>.</p>
 
@@ -974,7 +974,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.11_rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2011-November/047395.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2011-November/047395.html">announcement</a>
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.11-rc1.tar.bz2">2011.11-rc1
@@ -995,7 +995,7 @@
     <p>RC2 is out with more bugfixes. See the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08_rc2">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2011-August/045211.html">announcement</a>.
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2011-August/045211.html">announcement</a>.
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.08-rc2.tar.bz2">2011.08-rc2
@@ -1009,7 +1009,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08_rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2011-August/044855.html">announcement</a>.
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2011-August/044855.html">announcement</a>.
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.08-rc1.tar.bz2">2011.08-rc1
@@ -1043,7 +1043,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05_rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2011-May/043317.html">announcement</a>.
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2011-May/043317.html">announcement</a>.
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.05-rc1.tar.bz2">2011.05-rc1
@@ -1057,7 +1057,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2011-February/041662.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2011-February/041662.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.02.tar.bz2">2011.02 release</a>.</p>
 
@@ -1079,7 +1079,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.02_rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2011-February/041365.html">announcement</a>.
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2011-February/041365.html">announcement</a>.
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2011.02-rc1.tar.bz2">2011.02-rc1
@@ -1093,7 +1093,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2010-November/039135.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2010-November/039135.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.11.tar.bz2">2010.11 release</a>.</p>
 
@@ -1115,7 +1115,7 @@
     tree, see the <a
     href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.11_rc1">CHANGES</a>
     file for details, and read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2010-November/038645.html">announcement</a>.
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2010-November/038645.html">announcement</a>.
 
     <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.11-rc1.tar.bz2">2010.11-rc1
@@ -1131,7 +1131,7 @@
     Linux Conference Europe</a>. This <i>Developer Day</i> aims
     at allowing Buildroot developers to meet and exchange ideas on the
     project and its future. See the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2010-September/037930.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2010-September/037930.html">announcement</a>
     for more info.</p>
 
     <p>Thanks to Thomas Petazzoni for taking care of the practical
@@ -1143,7 +1143,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.08">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2010-August/037078.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2010-August/037078.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.08.tar.bz2">2010.08 release</a>.</p>
 
@@ -1182,7 +1182,7 @@
     contributing and testing the release candidates. See the
     <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2010.05">CHANGES</a>
     file for more details, read the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2010-May/034878.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2010-May/034878.html">announcement</a>
     and go to the <a href="/downloads/">downloads page</a> to pick up the
     <a href="/downloads/buildroot-2010.05.tar.bz2">2010.05 release</a>.</p>
 
@@ -1268,7 +1268,7 @@
 
     <p>The stable 2009.11 release is out - Thanks to everyone
     contributing and testing the release candidates. See the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2009-December/030672.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2009-December/030672.html">announcement</a>
     or <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.11">CHANGES</a>
     for more details, and go to the <a href="/downloads/">downloads page</a>
     to pick up the <a href="/downloads/buildroot-2009.11.tar.bz2">2009.11
@@ -1321,7 +1321,7 @@
 
     <p>The stable 2009.08 release is out - Thanks to everyone
     contributing and testing the release candidates. See the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2009-August/029018.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2009-August/029018.html">announcement</a>
     or <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.08">CHANGES</a>
     for more details, and go to the <a href="/downloads/">downloads page</a>
     to pick up the <a href="/downloads/buildroot-2009.08.tar.bz2">2009.08
@@ -1370,7 +1370,7 @@
 
     <p>The stable 2009.05 release is out - Thanks to everyone
     contributing and testing the release candidates. See the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2009-June/027640.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2009-June/027640.html">announcement</a>
     or <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05">CHANGES</a>
     for more details, and go to the <a href="/downloads/">downloads page</a>
     to pick up the <a href="/downloads/buildroot-2009.05.tar.bz2">2009.05
@@ -1446,7 +1446,7 @@
   <li><b>12 February 2009 -- 2009.02 released</b>
     <p>The stable 2009.02 release is out - Thanks to everyone
     contributing and testing the release candidates. See the
-    <a href="http://lists.busybox.net/pipermail/buildroot/2009-February/025974.html">announcement</a>
+    <a href="http://lists.buildroot.org/pipermail/buildroot/2009-February/025974.html">announcement</a>
     for more details, and go to the <a href="/downloads/">downloads page</a>
     to pick up the <a href="/downloads/buildroot-2009.02.tar.bz2">2009.02
     release</a>.</p>
diff --git a/docs/website/support.html b/docs/website/support.html
index c49a371..3b464b4 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -17,7 +17,7 @@ sharing website.</p>
 <h3>Mailing List Information</h3>
 <p>The <a href="/lists/buildroot/">mailing list</a> is for discussion and
 development.  You can subscribe by visiting
-<a href="http://lists.busybox.net/mailman/listinfo/buildroot">this page</a>.
+<a href="http://lists.buildroot.org/mailman/listinfo/buildroot">this page</a>.
 Only subscribers to the Buildroot mailing list are allowed to post
 to this list.</p>
 
