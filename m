From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 03:12:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs:  images
Message-ID: <20070119111247.AA83E48596@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 03:12:46 -0800 (Fri, 19 Jan 2007)
New Revision: 17377

Log:
- update valid HTML pic and temporarily enable referer checking


Added:
   trunk/buildroot/docs/images/valid-html401.png

Removed:
   trunk/buildroot/docs/images/vh40.gif

Modified:
   trunk/buildroot/docs/buildroot.html
   trunk/buildroot/docs/header.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-01-19 11:00:05 UTC (rev 17376)
+++ trunk/buildroot/docs/buildroot.html	2007-01-19 11:12:46 UTC (rev 17377)
@@ -12,7 +12,7 @@
 <body>
   <div class="main">
     <div class="titre">
-      <h1>Buildroot</h1>
+      <h1><a href="http://buildroot.uclibc.org/">Buildroot</a></h1>
     </div>
 
     <p>Usage and documentation by Thomas Petazzoni. Contributions from
@@ -648,5 +648,16 @@
     </ul>
 
   </div>
+<!--
+-->
+            <td>
+                <a href="http://validator.w3.org/check?uri=referer"><img
+                border="0" height="31" width="88"
+                src="images/valid-html401.png"
+                alt="Valid HTML"></a>
+            </td>
+<!--
+-->
+
 </body>
 </html>

Modified: trunk/buildroot/docs/header.html
===================================================================
--- trunk/buildroot/docs/header.html	2007-01-19 11:00:05 UTC (rev 17376)
+++ trunk/buildroot/docs/header.html	2007-01-19 11:12:46 UTC (rev 17377)
@@ -68,9 +68,11 @@
     <br><a href="http://www.tldp.org/HOWTO">Linux HOWTOs</a>
 
 <!--
+-->
     <a href="http://validator.w3.org/check/referer"><img
-     src="/images/vh40.gif" height=31 width=88
-          align=left border=0 alt="Valid HTML 4.0!"></a>
+     src="/images/valid-html401.png" height="31" width="88"
+          align="left" border="0" alt="Valid HTML"></a>
+<!--
 -->
 
 </td>

Added: trunk/buildroot/docs/images/valid-html401.png
===================================================================
(Binary files differ)


Property changes on: trunk/buildroot/docs/images/valid-html401.png
___________________________________________________________________
Name: svn:mime-type
   + application/octet-stream

Deleted: trunk/buildroot/docs/images/vh40.gif
===================================================================
(Binary files differ)
