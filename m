From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Feb 2010 09:42:30 +0100
Subject: [Buildroot] [git commit master] buildroot: we're in 2010 now
Message-ID: <20100224084255.35DD577672@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eb057575108d069e53c8aff4675d8505f817721a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile           |    2 +-
 docs/copyright.txt |    2 +-
 docs/footer.html   |    3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 76eeddb..fed6e12 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 # Makefile for buildroot2
 #
 # Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2006-2009 by the Buildroot developers <buildroot@uclibc.org>
+# Copyright (C) 2006-2010 by the Buildroot developers <buildroot@uclibc.org>
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
diff --git a/docs/copyright.txt b/docs/copyright.txt
index 77fb560..d4712a7 100644
--- a/docs/copyright.txt
+++ b/docs/copyright.txt
@@ -1,6 +1,6 @@
 
 The code and graphics on this website (and it's mirror sites, if any) are
-Copyright (c) 1999-2005 by Erik Andersen, 2006-2009 The Buildroot
+Copyright (c) 1999-2005 by Erik Andersen, 2006-2010 The Buildroot
 developers. All rights reserved.
 
 Documents on this Web site including their graphical elements, design, and
diff --git a/docs/footer.html b/docs/footer.html
index d8db037..11bfec2 100644
--- a/docs/footer.html
+++ b/docs/footer.html
@@ -9,7 +9,8 @@
 
     <p>
     <font face="arial, helvetica, sans-serif" size="-1">
-	<a HREF="/copyright.txt">Copyright &copy; 1999-2009 Erik Andersen</a>
+	<a HREF="/copyright.txt">Copyright &copy; 1999-2005 Erik Andersen,
+	2006-2010 The Buildroot developers</a>
 	<br>
 	Mail all comments, insults, suggestions and bribes to
 	<br>
-- 
1.6.3.3
