From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 13 Mar 2007 05:59:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070313125946.386164808D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-13 05:59:45 -0700 (Tue, 13 Mar 2007)
New Revision: 18084

Log:
- point to busybox-<version>.config


Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-03-13 11:02:33 UTC (rev 18083)
+++ trunk/buildroot/docs/buildroot.html	2007-03-13 12:59:45 UTC (rev 18084)
@@ -249,7 +249,7 @@
     </ol>
 
     <p>Otherwise, you can simply change the
-    <code>package/busybox/busybox.config</code> file if you know the options
+    <code>package/busybox/busybox-&lt;version&gt;.config</code> file if you know the options
     you want to change without using the configuration tool.</p>
     <p>If you want to use an existing config file for busybox, then see 
     section <a href="#environment_variables">environment variables</a>.</p>
