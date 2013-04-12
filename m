From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 12 Apr 2013 18:01:21 +0200
Subject: [Buildroot] [PATCH 1/2] at: rename patches version in the filename
Message-ID: <1365782482-7417-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

at: rename patches version in the filename regarding - 
bump to version 3.1.13

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 ...-remove-manual-compiler-check-with-AC_TR.patch} |    0
 ...-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} |    0
 ...Makefile.in-add-LDFLAGS-to-linking-stage.patch} |    0
 ...005-Makefile.in-replace-IROOT-by-DESTDIR.patch} |    0
 ...3.1.13-0006-Makefile.in-make-install-fix.patch} |    0
 ...x.patch => at-3.1.13-0007-getloadavg-fix.patch} |    0
 ...patch => at-3.1.13-0007-include-config-h.patch} |    0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename package/at/{at-3.1.12-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch => at-3.1.13-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch} (100%)
 rename package/at/{at-3.1.12-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch => at-3.1.13-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} (100%)
 rename package/at/{at-3.1.12-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch => at-3.1.13-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch} (100%)
 rename package/at/{at-3.1.12-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch => at-3.1.13-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch} (100%)
 rename package/at/{at-3.1.12-0006-Makefile.in-make-install-fix.patch => at-3.1.13-0006-Makefile.in-make-install-fix.patch} (100%)
 rename package/at/{at-3.1.12-0007-getloadavg-fix.patch => at-3.1.13-0007-getloadavg-fix.patch} (100%)
 rename package/at/{at-3.1.12-0007-include-config-h.patch => at-3.1.13-0007-include-config-h.patch} (100%)

diff --git a/package/at/at-3.1.12-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch b/package/at/at-3.1.13-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
similarity index 100%
rename from package/at/at-3.1.12-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
rename to package/at/at-3.1.13-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
diff --git a/package/at/at-3.1.12-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch b/package/at/at-3.1.13-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
similarity index 100%
rename from package/at/at-3.1.12-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
rename to package/at/at-3.1.13-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
diff --git a/package/at/at-3.1.12-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch b/package/at/at-3.1.13-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
similarity index 100%
rename from package/at/at-3.1.12-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
rename to package/at/at-3.1.13-0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
diff --git a/package/at/at-3.1.12-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/at-3.1.13-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch
similarity index 100%
rename from package/at/at-3.1.12-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch
rename to package/at/at-3.1.13-0005-Makefile.in-replace-IROOT-by-DESTDIR.patch
diff --git a/package/at/at-3.1.12-0006-Makefile.in-make-install-fix.patch b/package/at/at-3.1.13-0006-Makefile.in-make-install-fix.patch
similarity index 100%
rename from package/at/at-3.1.12-0006-Makefile.in-make-install-fix.patch
rename to package/at/at-3.1.13-0006-Makefile.in-make-install-fix.patch
diff --git a/package/at/at-3.1.12-0007-getloadavg-fix.patch b/package/at/at-3.1.13-0007-getloadavg-fix.patch
similarity index 100%
rename from package/at/at-3.1.12-0007-getloadavg-fix.patch
rename to package/at/at-3.1.13-0007-getloadavg-fix.patch
diff --git a/package/at/at-3.1.12-0007-include-config-h.patch b/package/at/at-3.1.13-0007-include-config-h.patch
similarity index 100%
rename from package/at/at-3.1.12-0007-include-config-h.patch
rename to package/at/at-3.1.13-0007-include-config-h.patch
-- 
1.7.9.5
