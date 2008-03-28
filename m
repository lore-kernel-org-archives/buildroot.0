From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 03:39:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/classpath
Message-ID: <20080328103928.36C0B3C355@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-28 03:39:27 -0700 (Fri, 28 Mar 2008)
New Revision: 21531

Log:
classpath: cleanup help text


Modified:
   trunk/buildroot/package/classpath/Config.in


Changeset:
Modified: trunk/buildroot/package/classpath/Config.in
===================================================================
--- trunk/buildroot/package/classpath/Config.in	2008-03-28 10:39:21 UTC (rev 21530)
+++ trunk/buildroot/package/classpath/Config.in	2008-03-28 10:39:27 UTC (rev 21531)
@@ -3,5 +3,9 @@
 	default n
 
 	help
-	  GNU Classpath, Essential Libraries for Java, is a GNU project to create free core class libraries for use with virtual machines and compilers for the java programming language
+	  GNU Classpath, Essential Libraries for Java, is a GNU
+	  project to create free core class libraries for use with
+	  virtual machines and compilers for the java programming
+	  language.
+
 	  http://www.classpath.org/
