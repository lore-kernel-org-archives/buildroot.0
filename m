From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 04:35:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070119123527.8A7DB485A4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 04:35:26 -0800 (Fri, 19 Jan 2007)
New Revision: 17378

Log:
- some minor corrections


Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-01-19 11:12:46 UTC (rev 17377)
+++ trunk/buildroot/docs/buildroot.html	2007-01-19 12:35:26 UTC (rev 17378)
@@ -395,7 +395,7 @@
 
     <p>If you want to use the generated toolchain for other purposes,
     you can configure Buildroot to generate it elsewhere using the
-    option of the configuration tool : <code>Build options ->
+    option of the configuration tool : <code>Build options -&gt;
     Toolchain and header file location</code>, which defaults to
     <code>$(BUILD_DIR)/staging_dir/</code>.</p>
 
@@ -434,7 +434,9 @@
         bool "foo"
         default n
         help
-	     This is a comment that explains what foo is.
+	  This is a comment that explains what foo is.
+
+	  http://foosoftware.org/foo/
 </pre>
 
     <p>Of course, you can add other options to configure particular
@@ -607,7 +609,7 @@
     if all package-sources are downloadable.</p>
 
     <p>Lines <a href="#line44">44-46</a> define a simple target to clean the software build
-    by calling the <i>Makefiles</i> with the appropriate option.<br>
+    by calling the <i>Makefiles</i> with the appropriate option.
     The <code>clean</code> target should run <code>make clean</code>
     on $(BUILD_DIR)/package-version and MUST uninstall all files of the
     package from $(STAGING_DIR) and from $(TARGET_DIR).</p>
@@ -650,12 +652,10 @@
   </div>
 <!--
 -->
-            <td>
-                <a href="http://validator.w3.org/check?uri=referer"><img
-                border="0" height="31" width="88"
-                src="images/valid-html401.png"
-                alt="Valid HTML"></a>
-            </td>
+	<a href="http://validator.w3.org/check?uri=referer"><img
+	border="0" height="31" width="88"
+	src="images/valid-html401.png"
+	alt="Valid HTML"></img></a>
 <!--
 -->
 
