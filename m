From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu,  7 Dec 2006 21:20:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltp-testsuite
Message-ID: <20061208052037.19A9E485C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-07 21:20:37 -0800 (Thu, 07 Dec 2006)
New Revision: 16809

Log:
generate.sh needs bash, so make it to ask for it by name


Added:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite-generate-needs-bash.patch


Changeset:
Added: trunk/buildroot/package/ltp-testsuite/ltp-testsuite-generate-needs-bash.patch
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite-generate-needs-bash.patch	2006-12-08 05:16:20 UTC (rev 16808)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite-generate-needs-bash.patch	2006-12-08 05:20:37 UTC (rev 16809)
@@ -0,0 +1,8 @@
+--- ltp-full-20061121/testcases/network/generate.sh.orig	2006-12-07 22:21:56.000000000 -0700
++++ ltp-full-20061121/testcases/network/generate.sh	2006-12-07 22:22:05.000000000 -0700
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+ #
+ #   Copyright (c) International Business Machines  Corp., 2001
+ #
