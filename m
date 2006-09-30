From: vapier at uclibc.org <vapier@uclibc.org>
Date: Sat, 30 Sep 2006 16:49:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc: 3.4.2 3.4.3
	3.4.4 3.4.5 3.4.6 4.0.0 4.0. etc...
Message-ID: <20060930234910.59596485CF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vapier
Date: 2006-09-30 16:49:09 -0700 (Sat, 30 Sep 2006)
New Revision: 16279

Log:
tidy up

Modified:
   trunk/buildroot/toolchain/gcc/3.4.2/300-libstdc++-pic.patch
   trunk/buildroot/toolchain/gcc/3.4.3/300-libstdc++-pic.patch
   trunk/buildroot/toolchain/gcc/3.4.4/300-libstdc++-pic.patch
   trunk/buildroot/toolchain/gcc/3.4.5/300-libstdc++-pic.patch
   trunk/buildroot/toolchain/gcc/3.4.6/300-libstdc++-pic.patch
   trunk/buildroot/toolchain/gcc/4.0.0/300-libstdc++-pic.patch
   trunk/buildroot/toolchain/gcc/4.0.1/300-libstdc++-pic.patch
   trunk/buildroot/toolchain/gcc/4.0.2/300-libstdc++-pic.patch
   trunk/buildroot/toolchain/gcc/4.0.3/300-libstdc++-pic.patch
   trunk/buildroot/toolchain/gcc/4.1.0/300-libstdc++-pic.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/3.4.2/300-libstdc++-pic.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/3.4.2/300-libstdc++-pic.patch	2006-09-30 21:08:56 UTC (rev 16278)
+++ trunk/buildroot/toolchain/gcc/3.4.2/300-libstdc++-pic.patch	2006-09-30 23:49:09 UTC (rev 16279)
@@ -1,7 +1,7 @@
 # DP: Build and install libstdc++_pic.a library.
 
---- gcc/libstdc++-v3/src/Makefile.am~	2003-02-28 09:21:05.000000000 +0100
-+++ gcc/libstdc++-v3/src/Makefile.am	2003-02-28 09:28:50.000000000 +0100
+--- gcc/libstdc++-v3/src/Makefile.am
++++ gcc/libstdc++-v3/src/Makefile.am
 @@ -224,6 +224,10 @@
  	  @OPT_LDFLAGS@ @SECTION_LDFLAGS@ $(AM_CXXFLAGS) $(LDFLAGS) -o $@
  
@@ -14,8 +14,8 @@
  if GLIBCPP_BUILD_DEBUG
  all-local: build_debug
 
---- gcc/libstdc++-v3/src/Makefile.in~	2004-02-21 09:55:48.000000000 +0100
-+++ gcc/libstdc++-v3/src/Makefile.in	2004-02-21 09:59:34.000000000 +0100
+--- gcc/libstdc++-v3/src/Makefile.in
++++ gcc/libstdc++-v3/src/Makefile.in
 @@ -585,7 +585,7 @@
  
  install-data-am: install-data-local

Modified: trunk/buildroot/toolchain/gcc/3.4.3/300-libstdc++-pic.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/3.4.3/300-libstdc++-pic.patch	2006-09-30 21:08:56 UTC (rev 16278)
+++ trunk/buildroot/toolchain/gcc/3.4.3/300-libstdc++-pic.patch	2006-09-30 23:49:09 UTC (rev 16279)
@@ -1,7 +1,7 @@
 # DP: Build and install libstdc++_pic.a library.
 
---- gcc/libstdc++-v3/src/Makefile.am~	2003-02-28 09:21:05.000000000 +0100
-+++ gcc/libstdc++-v3/src/Makefile.am	2003-02-28 09:28:50.000000000 +0100
+--- gcc/libstdc++-v3/src/Makefile.am
++++ gcc/libstdc++-v3/src/Makefile.am
 @@ -224,6 +224,10 @@
  	  @OPT_LDFLAGS@ @SECTION_LDFLAGS@ $(AM_CXXFLAGS) $(LDFLAGS) -o $@
  
@@ -14,8 +14,8 @@
  if GLIBCPP_BUILD_DEBUG
  all-local: build_debug
 
---- gcc/libstdc++-v3/src/Makefile.in~	2004-02-21 09:55:48.000000000 +0100
-+++ gcc/libstdc++-v3/src/Makefile.in	2004-02-21 09:59:34.000000000 +0100
+--- gcc/libstdc++-v3/src/Makefile.in
++++ gcc/libstdc++-v3/src/Makefile.in
 @@ -585,7 +585,7 @@
  
  install-data-am: install-data-local

Modified: trunk/buildroot/toolchain/gcc/3.4.4/300-libstdc++-pic.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/3.4.4/300-libstdc++-pic.patch	2006-09-30 21:08:56 UTC (rev 16278)
+++ trunk/buildroot/toolchain/gcc/3.4.4/300-libstdc++-pic.patch	2006-09-30 23:49:09 UTC (rev 16279)
@@ -1,7 +1,7 @@
 # DP: Build and install libstdc++_pic.a library.
 
---- gcc/libstdc++-v3/src/Makefile.am~	2003-02-28 09:21:05.000000000 +0100
-+++ gcc/libstdc++-v3/src/Makefile.am	2003-02-28 09:28:50.000000000 +0100
+--- gcc/libstdc++-v3/src/Makefile.am
++++ gcc/libstdc++-v3/src/Makefile.am
 @@ -224,6 +224,10 @@
  	  @OPT_LDFLAGS@ @SECTION_LDFLAGS@ $(AM_CXXFLAGS) $(LDFLAGS) -o $@
  
@@ -14,8 +14,8 @@
  if GLIBCPP_BUILD_DEBUG
  all-local: build_debug
 
---- gcc/libstdc++-v3/src/Makefile.in~	2004-02-21 09:55:48.000000000 +0100
-+++ gcc/libstdc++-v3/src/Makefile.in	2004-02-21 09:59:34.000000000 +0100
+--- gcc/libstdc++-v3/src/Makefile.in
++++ gcc/libstdc++-v3/src/Makefile.in
 @@ -585,7 +585,7 @@
  
  install-data-am: install-data-local

Modified: trunk/buildroot/toolchain/gcc/3.4.5/300-libstdc++-pic.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/3.4.5/300-libstdc++-pic.patch	2006-09-30 21:08:56 UTC (rev 16278)
+++ trunk/buildroot/toolchain/gcc/3.4.5/300-libstdc++-pic.patch	2006-09-30 23:49:09 UTC (rev 16279)
@@ -1,7 +1,7 @@
 # DP: Build and install libstdc++_pic.a library.
 
---- gcc/libstdc++-v3/src/Makefile.am~	2003-02-28 09:21:05.000000000 +0100
-+++ gcc/libstdc++-v3/src/Makefile.am	2003-02-28 09:28:50.000000000 +0100
+--- gcc/libstdc++-v3/src/Makefile.am
++++ gcc/libstdc++-v3/src/Makefile.am
 @@ -224,6 +224,10 @@
  	  @OPT_LDFLAGS@ @SECTION_LDFLAGS@ $(AM_CXXFLAGS) $(LDFLAGS) -o $@
  
@@ -14,8 +14,8 @@
  if GLIBCPP_BUILD_DEBUG
  all-local: build_debug
 
---- gcc/libstdc++-v3/src/Makefile.in~	2004-02-21 09:55:48.000000000 +0100
-+++ gcc/libstdc++-v3/src/Makefile.in	2004-02-21 09:59:34.000000000 +0100
+--- gcc/libstdc++-v3/src/Makefile.in
++++ gcc/libstdc++-v3/src/Makefile.in
 @@ -585,7 +585,7 @@
  
  install-data-am: install-data-local

Modified: trunk/buildroot/toolchain/gcc/3.4.6/300-libstdc++-pic.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/3.4.6/300-libstdc++-pic.patch	2006-09-30 21:08:56 UTC (rev 16278)
+++ trunk/buildroot/toolchain/gcc/3.4.6/300-libstdc++-pic.patch	2006-09-30 23:49:09 UTC (rev 16279)
@@ -1,7 +1,7 @@
 # DP: Build and install libstdc++_pic.a library.
 
---- gcc/libstdc++-v3/src/Makefile.am~	2003-02-28 09:21:05.000000000 +0100
-+++ gcc/libstdc++-v3/src/Makefile.am	2003-02-28 09:28:50.000000000 +0100
+--- gcc/libstdc++-v3/src/Makefile.am
++++ gcc/libstdc++-v3/src/Makefile.am
 @@ -224,6 +224,10 @@
  	  @OPT_LDFLAGS@ @SECTION_LDFLAGS@ $(AM_CXXFLAGS) $(LDFLAGS) -o $@
  
@@ -14,8 +14,8 @@
  if GLIBCPP_BUILD_DEBUG
  all-local: build_debug
 
---- gcc/libstdc++-v3/src/Makefile.in~	2004-02-21 09:55:48.000000000 +0100
-+++ gcc/libstdc++-v3/src/Makefile.in	2004-02-21 09:59:34.000000000 +0100
+--- gcc/libstdc++-v3/src/Makefile.in
++++ gcc/libstdc++-v3/src/Makefile.in
 @@ -585,7 +585,7 @@
  
  install-data-am: install-data-local

Modified: trunk/buildroot/toolchain/gcc/4.0.0/300-libstdc++-pic.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.0.0/300-libstdc++-pic.patch	2006-09-30 21:08:56 UTC (rev 16278)
+++ trunk/buildroot/toolchain/gcc/4.0.0/300-libstdc++-pic.patch	2006-09-30 23:49:09 UTC (rev 16279)
@@ -1,6 +1,5 @@
-diff -urN gcc-4.0.0-200/libstdc++-v3/src/Makefile.am gcc-4.0.0/libstdc++-v3/src/Makefile.am
---- gcc-4.0.0-200/libstdc++-v3/src/Makefile.am	2004-11-15 17:33:05.000000000 -0600
-+++ gcc-4.0.0/libstdc++-v3/src/Makefile.am	2005-04-28 21:42:18.614344056 -0500
+--- gcc-4.0.0/libstdc++-v3/src/Makefile.am
++++ gcc-4.0.0/libstdc++-v3/src/Makefile.am
 @@ -214,6 +214,10 @@
  	  $(OPT_LDFLAGS) $(SECTION_LDFLAGS) $(AM_CXXFLAGS) $(LDFLAGS) -o $@
  
@@ -12,9 +11,8 @@
  # Added bits to build debug library.
  if GLIBCXX_BUILD_DEBUG
  all-local: build_debug
-diff -urN gcc-4.0.0-200/libstdc++-v3/src/Makefile.in gcc-4.0.0/libstdc++-v3/src/Makefile.in
---- gcc-4.0.0-200/libstdc++-v3/src/Makefile.in	2005-02-01 00:56:27.000000000 -0600
-+++ gcc-4.0.0/libstdc++-v3/src/Makefile.in	2005-04-28 21:44:20.868758560 -0500
+--- gcc-4.0.0/libstdc++-v3/src/Makefile.in
++++ gcc-4.0.0/libstdc++-v3/src/Makefile.in
 @@ -625,7 +625,7 @@
  
  install-data-am: install-data-local

Modified: trunk/buildroot/toolchain/gcc/4.0.1/300-libstdc++-pic.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.0.1/300-libstdc++-pic.patch	2006-09-30 21:08:56 UTC (rev 16278)
+++ trunk/buildroot/toolchain/gcc/4.0.1/300-libstdc++-pic.patch	2006-09-30 23:49:09 UTC (rev 16279)
@@ -1,6 +1,5 @@
-diff -urN gcc-4.0.0-200/libstdc++-v3/src/Makefile.am gcc-4.0.0/libstdc++-v3/src/Makefile.am
---- gcc-4.0.0-200/libstdc++-v3/src/Makefile.am	2004-11-15 17:33:05.000000000 -0600
-+++ gcc-4.0.0/libstdc++-v3/src/Makefile.am	2005-04-28 21:42:18.614344056 -0500
+--- gcc-4.0.0/libstdc++-v3/src/Makefile.am
++++ gcc-4.0.0/libstdc++-v3/src/Makefile.am
 @@ -214,6 +214,10 @@
  	  $(OPT_LDFLAGS) $(SECTION_LDFLAGS) $(AM_CXXFLAGS) $(LDFLAGS) -o $@
  
@@ -12,9 +11,8 @@
  # Added bits to build debug library.
  if GLIBCXX_BUILD_DEBUG
  all-local: build_debug
-diff -urN gcc-4.0.0-200/libstdc++-v3/src/Makefile.in gcc-4.0.0/libstdc++-v3/src/Makefile.in
---- gcc-4.0.0-200/libstdc++-v3/src/Makefile.in	2005-02-01 00:56:27.000000000 -0600
-+++ gcc-4.0.0/libstdc++-v3/src/Makefile.in	2005-04-28 21:44:20.868758560 -0500
+--- gcc-4.0.0/libstdc++-v3/src/Makefile.in
++++ gcc-4.0.0/libstdc++-v3/src/Makefile.in
 @@ -625,7 +625,7 @@
  
  install-data-am: install-data-local

Modified: trunk/buildroot/toolchain/gcc/4.0.2/300-libstdc++-pic.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.0.2/300-libstdc++-pic.patch	2006-09-30 21:08:56 UTC (rev 16278)
+++ trunk/buildroot/toolchain/gcc/4.0.2/300-libstdc++-pic.patch	2006-09-30 23:49:09 UTC (rev 16279)
@@ -1,6 +1,5 @@
-diff -urN gcc-4.0.0-200/libstdc++-v3/src/Makefile.am gcc-4.0.0/libstdc++-v3/src/Makefile.am
---- gcc-4.0.0-200/libstdc++-v3/src/Makefile.am	2004-11-15 17:33:05.000000000 -0600
-+++ gcc-4.0.0/libstdc++-v3/src/Makefile.am	2005-04-28 21:42:18.614344056 -0500
+--- gcc-4.0.0/libstdc++-v3/src/Makefile.am
++++ gcc-4.0.0/libstdc++-v3/src/Makefile.am
 @@ -214,6 +214,10 @@
  	  $(OPT_LDFLAGS) $(SECTION_LDFLAGS) $(AM_CXXFLAGS) $(LDFLAGS) -o $@
  
@@ -12,9 +11,8 @@
  # Added bits to build debug library.
  if GLIBCXX_BUILD_DEBUG
  all-local: build_debug
-diff -urN gcc-4.0.0-200/libstdc++-v3/src/Makefile.in gcc-4.0.0/libstdc++-v3/src/Makefile.in
---- gcc-4.0.0-200/libstdc++-v3/src/Makefile.in	2005-02-01 00:56:27.000000000 -0600
-+++ gcc-4.0.0/libstdc++-v3/src/Makefile.in	2005-04-28 21:44:20.868758560 -0500
+--- gcc-4.0.0/libstdc++-v3/src/Makefile.in
++++ gcc-4.0.0/libstdc++-v3/src/Makefile.in
 @@ -625,7 +625,7 @@
  
  install-data-am: install-data-local

Modified: trunk/buildroot/toolchain/gcc/4.0.3/300-libstdc++-pic.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.0.3/300-libstdc++-pic.patch	2006-09-30 21:08:56 UTC (rev 16278)
+++ trunk/buildroot/toolchain/gcc/4.0.3/300-libstdc++-pic.patch	2006-09-30 23:49:09 UTC (rev 16279)
@@ -1,6 +1,5 @@
-diff -urN gcc-4.0.0-200/libstdc++-v3/src/Makefile.am gcc-4.0.0/libstdc++-v3/src/Makefile.am
---- gcc-4.0.0-200/libstdc++-v3/src/Makefile.am	2004-11-15 17:33:05.000000000 -0600
-+++ gcc-4.0.0/libstdc++-v3/src/Makefile.am	2005-04-28 21:42:18.614344056 -0500
+--- gcc-4.0.0/libstdc++-v3/src/Makefile.am
++++ gcc-4.0.0/libstdc++-v3/src/Makefile.am
 @@ -214,6 +214,10 @@
  	  $(OPT_LDFLAGS) $(SECTION_LDFLAGS) $(AM_CXXFLAGS) $(LDFLAGS) -o $@
  
@@ -12,9 +11,8 @@
  # Added bits to build debug library.
  if GLIBCXX_BUILD_DEBUG
  all-local: build_debug
-diff -urN gcc-4.0.0-200/libstdc++-v3/src/Makefile.in gcc-4.0.0/libstdc++-v3/src/Makefile.in
---- gcc-4.0.0-200/libstdc++-v3/src/Makefile.in	2005-02-01 00:56:27.000000000 -0600
-+++ gcc-4.0.0/libstdc++-v3/src/Makefile.in	2005-04-28 21:44:20.868758560 -0500
+--- gcc-4.0.0/libstdc++-v3/src/Makefile.in
++++ gcc-4.0.0/libstdc++-v3/src/Makefile.in
 @@ -625,7 +625,7 @@
  
  install-data-am: install-data-local

Modified: trunk/buildroot/toolchain/gcc/4.1.0/300-libstdc++-pic.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.1.0/300-libstdc++-pic.patch	2006-09-30 21:08:56 UTC (rev 16278)
+++ trunk/buildroot/toolchain/gcc/4.1.0/300-libstdc++-pic.patch	2006-09-30 23:49:09 UTC (rev 16279)
@@ -1,7 +1,7 @@
 # DP: Build and install libstdc++_pic.a library.
 
---- gcc-4.1.0/libstdc++-v3/src/Makefile.am	2004-11-15 17:33:05.000000000 -0600
-+++ gcc-4.1.0-patched/libstdc++-v3/src/Makefile.am	2005-04-25 20:05:59.186930896 -0500
+--- gcc-4.1.0/libstdc++-v3/src/Makefile.am
++++ gcc-4.1.0/libstdc++-v3/src/Makefile.am
 @@ -214,6 +214,10 @@
  	  $(OPT_LDFLAGS) $(SECTION_LDFLAGS) $(AM_CXXFLAGS) $(LDFLAGS) -o $@
  
@@ -13,8 +13,8 @@
  # Added bits to build debug library.
  if GLIBCXX_BUILD_DEBUG
  all-local: build_debug
---- gcc-4.1.0/libstdc++-v3/src/Makefile.in	2005-04-11 19:13:08.000000000 -0500
-+++ gcc-4.1.0-patched/libstdc++-v3/src/Makefile.in	2005-04-25 20:12:33.284316275 -0500
+--- gcc-4.1.0/libstdc++-v3/src/Makefile.in
++++ gcc-4.1.0/libstdc++-v3/src/Makefile.in
 @@ -627,7 +627,7 @@
  
  install-data-am: install-data-local
