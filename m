From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 16:26:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070812232629.71D51A6816@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 16:26:28 -0700 (Sun, 12 Aug 2007)
New Revision: 19471

Log:
Cleanup of docs

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-08-12 21:33:06 UTC (rev 19470)
+++ trunk/buildroot/docs/buildroot.html	2007-08-12 23:26:28 UTC (rev 19471)
@@ -15,7 +15,8 @@
       <h1>Buildroot</h1>
     </div>
 
-    <p><a href="http://buildroot.uclibc.org/">Buildroot</a> usage and documentation by Thomas Petazzoni. Contributions from
+    <p><a href="http://buildroot.uclibc.org/">Buildroot</a>
+    usage and documentation by Thomas Petazzoni. Contributions from
     Karsten Kruse, Ned Ludd, Martin Herren and others. </p>
 
     <p><small>$LastChangedDate$</small></p>
@@ -471,7 +472,7 @@
 </pre>
 
     <p><b>Important</b> : do not try to move a gcc-3.x toolchain to an other
-    directory, it won't work. There are some hard-coded paths in the
+    directory, it won't work. There are some hardcoded paths in the
     <i>gcc</i> configuration. If the default toolchain directory
     doesn't suit your needs, please refer to the <a
     href="#toolchain_standalone">Using the uClibc toolchain outside of
@@ -487,7 +488,7 @@
     <code>build_ARCH/staging_dir/</code>. But sometimes, it may be useful to
     install it somewhere else, so that it can be used to compile other programs
     or by other users. Moving the <code>build_ARCH/staging_dir/</code>
-    directory elsewhere is <b>not possible if using gcc-3.x</b>, because they 
+    directory elsewhere is <b>not possible if using gcc-3.x</b>, because there
     are some hardcoded paths in the toolchain configuration. This works, thanks 
     to sysroot support, with current, stable gcc-4.x toolchains, of course. </p>
 
