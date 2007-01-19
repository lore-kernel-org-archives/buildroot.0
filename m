From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 11:20:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070119192008.08C1C4858D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 11:20:07 -0800 (Fri, 19 Jan 2007)
New Revision: 17387

Log:
- explicitely mention -clean and -dirclean targets so it is easier to search for them


Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-01-19 19:14:33 UTC (rev 17386)
+++ trunk/buildroot/docs/buildroot.html	2007-01-19 19:20:07 UTC (rev 17387)
@@ -644,13 +644,13 @@
 
     <p>Lines <a href="#line44">44-46</a> define a simple target to clean the software build
     by calling the <i>Makefiles</i> with the appropriate option.
-    The <code>clean</code> target should run <code>make clean</code>
+    The <code>-clean</code> target should run <code>make clean</code>
     on $(BUILD_DIR)/package-version and MUST uninstall all files of the
     package from $(STAGING_DIR) and from $(TARGET_DIR).</p>
 
     <p>Lines <a href="#line48">48-49</a> define a simple target to completely remove the
     directory in which the software was uncompressed, configured and
-    compiled. This target MUST completely rm $(BUILD_DIR)/package-version.</p>
+    compiled. The <code>-dirclean</code> target MUST completely rm $(BUILD_DIR)/package-version.</p>
 
     <p>Lines <a href="#line51">51-58</a> adds the target <code>foo</code> to the list
     of targets to be compiled by Buildroot by first checking if
