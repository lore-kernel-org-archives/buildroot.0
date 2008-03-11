From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 11:12:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bash
Message-ID: <20080311181215.53B20120135@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 11:12:15 -0700 (Tue, 11 Mar 2008)
New Revision: 21299

Log:
added debug option

Modified:
   trunk/buildroot/package/bash/bash.mk


Changeset:
Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2008-03-11 17:58:47 UTC (rev 21298)
+++ trunk/buildroot/package/bash/bash.mk	2008-03-11 18:12:15 UTC (rev 21299)
@@ -57,6 +57,7 @@
 		--with-curses \
 		--enable-alias \
 		--without-bash-malloc \
+		$(ENABLE_DEBUG) \
 	)
 	touch $@
 
