From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 00:15:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20081208081547.0A053F801B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 00:15:46 -0800 (Mon, 08 Dec 2008)
New Revision: 24309

Log:
docs/: get rid of unneeded $(strip ..)

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2008-12-08 08:15:42 UTC (rev 24308)
+++ trunk/buildroot/docs/buildroot.html	2008-12-08 08:15:46 UTC (rev 24309)
@@ -959,7 +959,7 @@
     <a name="line53" id="line53">53</a> # Toplevel Makefile options
     <a name="line54" id="line54">54</a> #
     <a name="line55" id="line55">55</a> #############################################################
-    <a name="line56" id="line56">56</a> ifeq ($(strip $(BR2_PACKAGE_FOO)),y)
+    <a name="line56" id="line56">56</a> ifeq ($(BR2_PACKAGE_FOO),y)
     <a name="line57" id="line57">57</a> TARGETS+=foo
     <a name="line58" id="line58">58</a> endif
 
