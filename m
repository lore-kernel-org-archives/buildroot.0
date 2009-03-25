From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Mar 2009 15:54:41 +0000 (UTC)
Subject: [Buildroot] svn commit: [25818] trunk/buildroot/docs
Message-ID: <20090325155441.9B53676A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-25 15:54:41 +0000 (Wed, 25 Mar 2009)
New Revision: 25818

Log:
docs/: show about.html as index page

The about page is more informative for new users than the list of news,
so shown that one per default instead.

Modified:
   trunk/buildroot/docs/index.html


Changeset:
Modified: trunk/buildroot/docs/index.html
===================================================================
--- trunk/buildroot/docs/index.html	2009-03-25 15:54:29 UTC (rev 25817)
+++ trunk/buildroot/docs/index.html	2009-03-25 15:54:41 UTC (rev 25818)
@@ -1 +1 @@
-<!--#include file="news.html" -->
+<!--#include file="about.html" -->
