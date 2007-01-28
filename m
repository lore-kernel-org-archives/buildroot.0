From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 28 Jan 2007 03:57:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070128115701.04A4E4855D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-28 03:57:00 -0800 (Sun, 28 Jan 2007)
New Revision: 17592

Log:
- fix indentation of help texts


Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-01-28 11:14:26 UTC (rev 17591)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-01-28 11:57:00 UTC (rev 17592)
@@ -96,16 +96,16 @@
 	bool "Enable setjmp/longjmp exceptions?"
 	default n
 	help
-	    For some platforms, proper stack unwinding works perfectly,
-	    while other platforms must use setjmp/longjmp exceptions for
-	    proper stack unwinding during exception handling.  Most people
-	    can leave this set to n.
+	  For some platforms, proper stack unwinding works perfectly,
+	  while other platforms must use setjmp/longjmp exceptions for
+	  proper stack unwinding during exception handling.  Most people
+	  can leave this set to n.
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
 	default ""
 	help
-	    Any additional gcc options you may want to include....
+	  Any additional gcc configure options you may want to include....
 
 config BR2_INSTALL_LIBSTDCPP
 	bool "Build/install c++ compiler and libstdc++?"
@@ -113,35 +113,33 @@
 	# huh? why so? select BR2_LARGEFILE
 	select BR2_LARGEFILE if !BR2_GCC_VERSION_4_2
 	help
-	    Build/install c++ compiler and libstdc++?
+	  Build/install c++ compiler and libstdc++?
 
 config BR2_INSTALL_LIBGCJ
 	bool "Build/install java compiler and libgcj?"
 	default n
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	    Build/install java compiler and libgcj?
+	  Build/install java compiler and libgcj?
 
 config BR2_INSTALL_OBJC
 	bool "Build/install Objective-C compiler and runtime?"
 	default n
 	help
-	    Build/install Objective-C compiler and runtime?
+	  Build/install Objective-C compiler and runtime?
 
 config BR2_INSTALL_FORTRAN
 	bool "Build/install Fortran compiler and runtime?"
 	default n
 	select BR2_PACKAGE_LIBMPFR
 	help
-	    Build/install Fortran compiler and runtime?
-	    Note that it is highly recommended NOT to use gfortran
-	    from gcc older than 4.2.0
+	  Build/install Fortran compiler and runtime?
+	  Note that it is highly recommended NOT to use gfortran
+	  from gcc older than 4.2.0
 
-	    You have been warned..
-
 config BR2_GCC_SHARED_LIBGCC
 	bool "Build/install a shared libgcc?"
 	default y
 	help
-	    Build/install a shared libgcc library
+	  Build/install a shared libgcc library
 
