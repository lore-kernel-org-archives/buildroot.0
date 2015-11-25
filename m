From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 25 Nov 2015 13:53:30 +0000
Subject: [Buildroot] [PATCH v2 2/2] at: rename patches so they are in a
	consecutive order
Message-ID: <1448459610-1256-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Generate the patch with -M option. This way is much shorter and readable.

 ...ch => 0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} | 0
 ...T-by-DESTDIR.patch => 0002-Makefile.in-replace-IROOT-by-DESTDIR.patch} | 0
 ....in-make-install-fix.patch => 0003-Makefile.in-make-install-fix.patch} | 0
 package/at/{0006-getloadavg.c-fix.patch => 0004-getloadavg.c-fix.patch}   | 0
 ...e.l-include-config-h.patch => 0005-parsetime.l-include-config-h.patch} | 0
 ...sleap-assumption.patch => 0006-remove-glibc-__isleap-assumption.patch} | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename package/at/{0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch => 0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} (100%)
 rename package/at/{0004-Makefile.in-replace-IROOT-by-DESTDIR.patch => 0002-Makefile.in-replace-IROOT-by-DESTDIR.patch} (100%)
 rename package/at/{0005-Makefile.in-make-install-fix.patch => 0003-Makefile.in-make-install-fix.patch} (100%)
 rename package/at/{0006-getloadavg.c-fix.patch => 0004-getloadavg.c-fix.patch} (100%)
 rename package/at/{0007-parsetime.l-include-config-h.patch => 0005-parsetime.l-include-config-h.patch} (100%)
 rename package/at/{0008-remove-glibc-__isleap-assumption.patch => 0006-remove-glibc-__isleap-assumption.patch} (100%)

diff --git a/package/at/0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch b/package/at/0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
similarity index 100%
rename from package/at/0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
rename to package/at/0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
diff --git a/package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/0002-Makefile.in-replace-IROOT-by-DESTDIR.patch
similarity index 100%
rename from package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
rename to package/at/0002-Makefile.in-replace-IROOT-by-DESTDIR.patch
diff --git a/package/at/0005-Makefile.in-make-install-fix.patch b/package/at/0003-Makefile.in-make-install-fix.patch
similarity index 100%
rename from package/at/0005-Makefile.in-make-install-fix.patch
rename to package/at/0003-Makefile.in-make-install-fix.patch
diff --git a/package/at/0006-getloadavg.c-fix.patch b/package/at/0004-getloadavg.c-fix.patch
similarity index 100%
rename from package/at/0006-getloadavg.c-fix.patch
rename to package/at/0004-getloadavg.c-fix.patch
diff --git a/package/at/0007-parsetime.l-include-config-h.patch b/package/at/0005-parsetime.l-include-config-h.patch
similarity index 100%
rename from package/at/0007-parsetime.l-include-config-h.patch
rename to package/at/0005-parsetime.l-include-config-h.patch
diff --git a/package/at/0008-remove-glibc-__isleap-assumption.patch b/package/at/0006-remove-glibc-__isleap-assumption.patch
similarity index 100%
rename from package/at/0008-remove-glibc-__isleap-assumption.patch
rename to package/at/0006-remove-glibc-__isleap-assumption.patch
-- 
2.4.10
