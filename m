From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Mar 2009 08:34:28 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20090302083428.A56D07656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-02 08:34:28 +0000 (Mon, 02 Mar 2009)
New Revision: 25479

Log:
docs/buildroot.html: we DO make releases nowadays

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2009-03-02 08:34:20 UTC (rev 25478)
+++ trunk/buildroot/docs/buildroot.html	2009-03-02 08:34:28 UTC (rev 25479)
@@ -116,9 +116,13 @@
 
     <h2><a name="download" id="download"></a>Obtaining Buildroot</h2>
 
-    <p>Buildroot is available as daily SVN snapshots or directly using
-    SVN. As of today, no stable releases of Buildroot are made. </p>
+    <p>Buildroot releases are made approximately every 3
+    months. Direct SVN access and daily SVN snapshots are also
+    available if you want more bleeding edge.</p>
 
+    <p>Releases are available at <a
+    href="http://buildroot.net/downloads/">http://buildroot.net/downloads/</a>.</p>
+
     <p>The latest snapshot is always available at <a
     href="http://buildroot.net/downloads/snapshots/buildroot-snapshot.tar.bz2">http://buildroot.net/downloads/snapshots/buildroot-snapshot.tar.bz2</a>,
     and previous snapshots are also available at <a
@@ -127,7 +131,7 @@
     <p>To download Buildroot using SVN, you can simply follow
     the rules described on the &quot;Accessing SVN&quot;-page (<a href=
     "http://buildroot.net/subversion.html">http://buildroot.net/subversion.html</a>)
-    of the uClibc buildroot website (<a href=
+    of the Buildroot website (<a href=
     "http://buildroot.net">http://buildroot.net</a>), and download the
     <code>buildroot</code> SVN module. For the impatient, here's a quick
     recipe:</p>
