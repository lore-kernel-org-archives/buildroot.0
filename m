From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 20 Sep 2007 04:14:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070920111448.37A9D30051@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-20 04:14:47 -0700 (Thu, 20 Sep 2007)
New Revision: 19907

Log:
- add missing ';'


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-09-20 11:08:13 UTC (rev 19906)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-09-20 11:14:47 UTC (rev 19907)
@@ -161,7 +161,7 @@
 	    fi; \
 	  fi; \
 	else \
-	  echo "This must be wrong. Why do you need to special-case _any_ package here? Skipping until this is resolved properly." \
+	  echo "This must be wrong. Why do you need to special-case _any_ package here? Skipping until this is resolved properly."; \
 	  if false && test "$(wildcard package/x11r7/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
 	    toolchain/patch-kernel.sh $(@D) package/x11r7/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
 	  else \
