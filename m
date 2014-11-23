From: Pedro Aguilar <paguilar@paguilar.org>
Date: Sun, 23 Nov 2014 20:20:48 +0100
Subject: [Buildroot] [PATCH v5 0/1] package/guile: New package
Message-ID: <1416770449-4246-1-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the suggestion made by Yann Morin in 
guile:

Add "depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # bdwgc"
Break long line GUILE_CFLAGS to improve readability

Pedro Aguilar (1):
  guile: new package

 package/Config.in                                  |  1 +
 package/guile/Config.in                            | 17 ++++++++++
 package/guile/guile-01-fix_arm_endianness.patch    | 25 +++++++++++++++
 .../guile/guile-02-calculate-csqrt_manually.patch  | 16 ++++++++++
 package/guile/guile-03-remove_unused_funcs.patch   | 36 ++++++++++++++++++++++
 package/guile/guile.mk                             | 31 +++++++++++++++++++
 6 files changed, 126 insertions(+)
 create mode 100644 package/guile/Config.in
 create mode 100644 package/guile/guile-01-fix_arm_endianness.patch
 create mode 100644 package/guile/guile-02-calculate-csqrt_manually.patch
 create mode 100644 package/guile/guile-03-remove_unused_funcs.patch
 create mode 100644 package/guile/guile.mk

-- 
1.9.1
