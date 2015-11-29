From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 15:26:40 +0100
Subject: [Buildroot] [git commit branch/next] at: rename patches so they are
	in a consecutive order
Message-ID: <20151129142905.5ABDF7F8FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a7fce0c953c6f90e2da29e349a65a1335610e42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} |    0
 ...002-Makefile.in-replace-IROOT-by-DESTDIR.patch} |    0
 ...tch => 0003-Makefile.in-make-install-fix.patch} |    0
 ...avg.c-fix.patch => 0004-getloadavg.c-fix.patch} |    0
 ...tch => 0005-parsetime.l-include-config-h.patch} |    0
 ...=> 0006-remove-glibc-__isleap-assumption.patch} |    0
 6 files changed, 0 insertions(+), 0 deletions(-)

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
