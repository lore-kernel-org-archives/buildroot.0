From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 11:28:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070119192839.2183F48586@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 11:28:39 -0800 (Fri, 19 Jan 2007)
New Revision: 17389

Log:
- duh. add missing listentry stop markers


Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-01-19 19:21:03 UTC (rev 17388)
+++ trunk/buildroot/docs/buildroot.html	2007-01-19 19:28:39 UTC (rev 17389)
@@ -177,10 +177,10 @@
     <p>Buildroot optionally honors some environment variables that are passed
     to <code>make</code> :</p>
     <ul>
-    <li>HOSTCXX
-    <li>HOSTCC
-    <li>UCLIBC_CONFIG_FILE=&lt;path/to/.config&gt;
-    <li>BUSYBOX_CONFIG_FILE=&lt;path/to/.config&gt;
+    <li>HOSTCXX</li>
+    <li>HOSTCC</li>
+    <li>UCLIBC_CONFIG_FILE=&lt;path/to/.config&gt;</li>
+    <li>BUSYBOX_CONFIG_FILE=&lt;path/to/.config&gt;</li>
     </ul>
 
     <p>An example that uses config files located in the toplevel directory and
