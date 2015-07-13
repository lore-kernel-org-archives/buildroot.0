From: =?UTF-8?Q?Aur=C3=A9lien_Chabot?= <aurelien@chabot.fr>
Date: Tue, 14 Jul 2015 01:54:44 +0200
Subject: [Buildroot] [PATCH 1/2] at: bump version 3.1.16
Message-ID: <CAJup9ci1w6Q+xVhz+iQ6vqouLZype1frLydwz7nSFch1D1+ZHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 ...c-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch |  36 +++++++
 ...c-remove-manual-compiler-check-with-AC_TR.patch |  33 -------
 ...0002-Makefile.in-replace-IROOT-by-DESTDIR.patch | 107 +++++++++++++++++++++
 ...c-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch |  34 -------
 ...-Makefile.in-add-LDFLAGS-to-linking-stage.patch |  38 --------
 ...-fix-make-install-for-non-root-don-t-stri.patch |  85 ++++++++++++++++
 ...0004-Makefile.in-replace-IROOT-by-DESTDIR.patch |  97 -------------------
 ...avg.c-compilation-revert-to-3.1.10-versio.patch |  38 ++++++++
 .../at/0005-Make-sure-to-include-config.h.patch    |  29 ++++++
 package/at/0005-Makefile.in-make-install-fix.patch |  69 -------------
 package/at/0006-getloadavg.c-fix.patch             |  30 ------
 package/at/0006-remove-glibc-assumption.patch      |  61 ++++++++++++
 package/at/0007-parsetime.l-include-config-h.patch |  16 ---
 .../at/0008-remove-glibc-__isleap-assumption.patch |  59 ------------
 package/at/at.hash                                 |   7 +-
 package/at/at.mk                                   |   2 +-
 16 files changed, 360 insertions(+), 381 deletions(-)
 create mode 100644
package/at/0001-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
 delete mode 100644
package/at/0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
 create mode 100644 package/at/0002-Makefile.in-replace-IROOT-by-DESTDIR.patch
 delete mode 100644
package/at/0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
 delete mode 100644
package/at/0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
 create mode 100644
package/at/0003-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
 delete mode 100644 package/at/0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
 create mode 100644
package/at/0004-fix-getloadavg.c-compilation-revert-to-3.1.10-versio.patch
 create mode 100644 package/at/0005-Make-sure-to-include-config.h.patch
 delete mode 100644 package/at/0005-Makefile.in-make-install-fix.patch
 delete mode 100644 package/at/0006-getloadavg.c-fix.patch
 create mode 100644 package/at/0006-remove-glibc-assumption.patch
 delete mode 100644 package/at/0007-parsetime.l-include-config-h.patch
 delete mode 100644 package/at/0008-remove-glibc-__isleap-assumption.patch
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-at-bump-version-3.1.16.patch
Type: text/x-patch
Size: 36688 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150714/9e7a4a6c/attachment.bin>
