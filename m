From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 01:17:13 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20061213091713.5DD8348565@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 01:17:12 -0800 (Wed, 13 Dec 2006)
New Revision: 16881

Log:
- spelling fix


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-12-13 09:14:10 UTC (rev 16880)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-12-13 09:17:12 UTC (rev 16881)
@@ -14,7 +14,7 @@
 if test -n "$CC" ; then
 	echo "CC clean:						FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CC' so buildroot can run with";
-	/bin/echo -e "a clean enviroment on your build machine\n";
+	/bin/echo -e "a clean environment on your build machine\n";
 	exit 1;
 fi;
 echo "CC clean:					Ok"
@@ -23,7 +23,7 @@
 if test -n "$CXX" ; then
 	echo "CXX clean:					FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CXX' so buildroot can run with";
-	/bin/echo -e "a clean enviroment on your build machine\n";
+	/bin/echo -e "a clean environment on your build machine\n";
 	exit 1;
 fi;
 echo "CXX clean:					Ok"
@@ -32,7 +32,7 @@
 if test -n "$CPP" ; then
 	echo "CPP clean:					FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CPP' so buildroot can run with";
-	/bin/echo -e "a clean enviroment on your build machine\n";
+	/bin/echo -e "a clean environment on your build machine\n";
 	exit 1;
 fi;
 echo "CPP clean:					Ok"
@@ -41,7 +41,7 @@
 if test -n "$CFLAGS" ; then
 	echo "CFLAGS clean:					FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CFLAGS' so buildroot can run with";
-	/bin/echo -e "a clean enviroment on your build machine\n";
+	/bin/echo -e "a clean environment on your build machine\n";
 	exit 1;
 fi;
 echo "CFLAGS clean:					Ok"
@@ -50,7 +50,7 @@
 if test -n "$CXXFLAGS" ; then
 	echo "CXXFLAGS clean:					FALSE"
 	/bin/echo -e "\n\nYou must run 'unset CXXFLAGS' so buildroot can run with";
-	/bin/echo -e "a clean enviroment on your build machine\n";
+	/bin/echo -e "a clean environment on your build machine\n";
 	exit 1;
 fi;
 echo "CXXFLAGS clean:					Ok"
