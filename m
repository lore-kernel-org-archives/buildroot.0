From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Wed, 25 Mar 2009 14:41:23 +0000 (UTC)
Subject: [Buildroot] svn commit: [25815] trunk/buildroot/docs
Message-ID: <20090325144123.E6F3E76A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2009-03-25 14:41:23 +0000 (Wed, 25 Mar 2009)
New Revision: 25815

Log:
Remove useless <ol>...</ol> tags

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2009-03-25 14:21:49 UTC (rev 25814)
+++ trunk/buildroot/docs/buildroot.html	2009-03-25 14:41:23 UTC (rev 25815)
@@ -653,9 +653,7 @@
     can configure the build. </p>
 
     <h2><a name="Linux" id="Linux"></a>Linux</h2>
-    <ol>
 
-
      <p>The user can select from three different Linux strategies:
 
      <ul>
@@ -694,7 +692,6 @@
 	buildroot starts the linux configuration system, which
 	defaults to "make menuconfig".
      </p>
-    </ol>
 
     <h2><a name="Todo" id="Todo"></a>Todo</h2>
     <ol>
