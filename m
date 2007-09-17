From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 17 Sep 2007 06:44:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20070917134406.E3F2230077@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-17 06:44:03 -0700 (Mon, 17 Sep 2007)
New Revision: 19874

Log:
- wants --with-gmp-build nowadays


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-09-17 13:17:13 UTC (rev 19873)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-09-17 13:44:03 UTC (rev 19874)
@@ -57,7 +57,7 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		$(PREFERRED_LIB_FLAGS) \
-		--with-gmp=$(GMP_TARGET_DIR) \
+		--with-gmp-build=$(GMP_TARGET_DIR) \
 		$(DISABLE_NLS) \
 	)
 	touch $@
