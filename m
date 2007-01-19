From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 01:24:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070119092441.1E5E44857E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 01:24:39 -0800 (Fri, 19 Jan 2007)
New Revision: 17373

Log:
- make sure that URLs are standard conforming
  Let's see if the date property works..


Modified:
   trunk/buildroot/docs/buildroot.html
   trunk/buildroot/docs/header.html
   trunk/buildroot/docs/lists.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-01-19 02:04:09 UTC (rev 17372)
+++ trunk/buildroot/docs/buildroot.html	2007-01-19 09:24:39 UTC (rev 17373)
@@ -18,7 +18,7 @@
     <p>Usage and documentation by Thomas Petazzoni. Contributions from
     Karsten Kruse, Ned Ludd, Martin Herren.</p>
 
-    <p><small>Last modification : $Id: buildroot-documentation.html,v 1.2 2004/12/28 19:15:20 andersen Exp $</small></p>
+    <p><small>$LastChangedDate$</small></p>
 
     <ul>
       <li><a href="#about">About Buildroot</a></li>
@@ -57,7 +57,7 @@
     case, <code>gcc</code>), binary utils like assembler and linker
     (in our case, <code>binutils</code>) and a C standard library (for
     example <a href="http://www.gnu.org/software/libc/libc.html">GNU
-    Libc</a>, <a href="http://www.uclibc.org">uClibc</a> or <a
+    Libc</a>, <a href="http://www.uclibc.org/">uClibc</a> or <a
     href="http://www.fefe.de/dietlibc/">dietlibc</a>). The system
     installed on your development station certainly already has a
     compilation toolchain that you can use to compile application that
@@ -226,7 +226,7 @@
     configuration</h2>
 
     <p>Just like <a href="#custom_busybox">BusyBox</a>, <a
-    href="http://www.uclibc.org">uClibc</a> offers a lot of
+    href="http://www.uclibc.org/">uClibc</a> offers a lot of
     configuration options. They allow to select various
     functionalities, depending on your needs and limitations.</p>
 


Property changes on: trunk/buildroot/docs/buildroot.html
___________________________________________________________________
Name: svn:keywords
   + Date

Modified: trunk/buildroot/docs/header.html
===================================================================
--- trunk/buildroot/docs/header.html	2007-01-19 02:04:09 UTC (rev 17372)
+++ trunk/buildroot/docs/header.html	2007-01-19 09:24:39 UTC (rev 17373)
@@ -60,7 +60,7 @@
     <br><a href="http://www.scratchbox.org/">Scratchbox</a>
     <br><a href="http://openembedded.org/">OpenEmbedded</a>
     <br><a href="http://www.ucdot.org/">uCdot</a>
-    <br><a href="http://www.linuxdevices.com">LinuxDevices</a>
+    <br><a href="http://www.linuxdevices.com/">LinuxDevices</a>
     <br><a href="http://slashdot.org/">Slashdot</a>
     <br><a href="http://freshmeat.net/">Freshmeat</a>
     <br><a href="http://linuxtoday.com/">Linux Today</a>

Modified: trunk/buildroot/docs/lists.html
===================================================================
--- trunk/buildroot/docs/lists.html	2007-01-19 02:04:09 UTC (rev 17372)
+++ trunk/buildroot/docs/lists.html	2007-01-19 09:24:39 UTC (rev 17373)
@@ -26,7 +26,7 @@
 <br>
 <input type="submit" name="sa" value="search the mailing list archives">
 <br>
-<a href="http://www.google.com"><img src="http://www.google.com/logos/Logo_25wht.gif" border="0" alt="Google" height="32" width="75" align="middle"></a>
+<a href="http://www.google.com/"><img src="http://www.google.com/logos/Logo_25wht.gif" border="0" alt="Google" height="32" width="75" align="middle"></a>
 <br>
 </form>
 </center>
