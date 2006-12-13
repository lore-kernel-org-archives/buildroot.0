From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 12 Dec 2006 23:25:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20061213072522.D560548583@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-12 23:25:22 -0800 (Tue, 12 Dec 2006)
New Revision: 16875

Log:
fix cut-n-paste typo, where I replaced CFLAGS with two copies CXXFLAGS
fix spacing on env var failure notices


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-12-13 07:21:16 UTC (rev 16874)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-12-13 07:25:22 UTC (rev 16875)
@@ -12,7 +12,7 @@
 #
 #############################################################
 if test -n "$CC" ; then
-	echo "CC clean:					FALSE"
+	echo "CC clean:						FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CC' so buildroot can run with";
 	/bin/echo -e "a clean enviroment on your build machine\n";
 	exit 1;
@@ -21,7 +21,7 @@
 
 
 if test -n "$CXX" ; then
-	echo "CXX clean:				FALSE"
+	echo "CXX clean:					FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CXX' so buildroot can run with";
 	/bin/echo -e "a clean enviroment on your build machine\n";
 	exit 1;
@@ -30,7 +30,7 @@
 
 
 if test -n "$CPP" ; then
-	echo "CPP clean:				FALSE"
+	echo "CPP clean:					FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CPP' so buildroot can run with";
 	/bin/echo -e "a clean enviroment on your build machine\n";
 	exit 1;
@@ -38,17 +38,17 @@
 echo "CPP clean:					Ok"
 
 
-if test -n "$CXXFLAGS" ; then
-	echo "CXXFLAGS clean:				FALSE"
-	/bin/echo -e "\n\nYou must run 'unset CXXFLAGS' so buildroot can run with";
+if test -n "$CFLAGS" ; then
+	echo "CFLAGS clean:					FALSE"
+	/bin/echo -e "\n\nYou must run 'unset CFLAGS' so buildroot can run with";
 	/bin/echo -e "a clean enviroment on your build machine\n";
 	exit 1;
 fi;
-echo "CXXFLAGS clean:					Ok"
+echo "CFLAGS clean:					Ok"
 
 
 if test -n "$CXXFLAGS" ; then
-	echo "CXXFLAGS clean:				FALSE"
+	echo "CXXFLAGS clean:					FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CXXFLAGS' so buildroot can run with";
 	/bin/echo -e "a clean enviroment on your build machine\n";
 	exit 1;
