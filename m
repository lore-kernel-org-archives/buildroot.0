From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Mon, 15 Dec 2008 14:14:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20081215221402.4C8E93C6F0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-12-15 14:14:02 -0800 (Mon, 15 Dec 2008)
New Revision: 24427

Log:
Mention another important benefit of Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2008-12-15 22:07:38 UTC (rev 24426)
+++ trunk/buildroot/docs/buildroot.html	2008-12-15 22:14:02 UTC (rev 24427)
@@ -108,6 +108,12 @@
     each <code>gcc</code> and <code>binutils</code> version to make them work
     on most architectures. </p>
 
+    <p>Moreover, Buildroot provides an infrastructure for reproducing
+    the build process of your embedded root filesystem. Being able to
+    reproduce the build process will be useful when a component needs
+    to be patched or updated, or when another person is supposed to
+    take over the project.</p>
+
     <h2><a name="download" id="download"></a>Obtaining Buildroot</h2>
 
     <p>Buildroot is available as daily SVN snapshots or directly using
