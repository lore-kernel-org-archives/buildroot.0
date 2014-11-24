From: Pedro Aguilar <paguilar@paguilar.org>
Date: Mon, 24 Nov 2014 23:56:26 +0100
Subject: [Buildroot] [PATCH v5 0/4] package/guile: New package
Message-ID: <1416869790-12988-1-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are the full series needed for adding guile.
It contains all the suggestions made in the previous patch versions.

Pedro Aguilar (4):
  libatomic_ops: Add host-libatomic_ops
  bdwgc: Add new package
  libunistring: host-libunistring is needed by guile
  guile: Add new package

 package/Config.in                                  |  2 ++
 package/bdwgc/Config.in                            | 10 ++++++
 package/bdwgc/bdwgc.mk                             | 20 ++++++++++++
 package/guile/Config.in                            | 17 ++++++++++
 package/guile/guile-01-fix_arm_endianness.patch    | 25 +++++++++++++++
 .../guile/guile-02-calculate-csqrt_manually.patch  | 16 ++++++++++
 package/guile/guile-03-remove_unused_funcs.patch   | 36 ++++++++++++++++++++++
 package/guile/guile.mk                             | 31 +++++++++++++++++++
 package/libatomic_ops/libatomic_ops.mk             |  1 +
 package/libunistring/libunistring.mk               |  1 +
 10 files changed, 159 insertions(+)
 create mode 100644 package/bdwgc/Config.in
 create mode 100644 package/bdwgc/bdwgc.mk
 create mode 100644 package/guile/Config.in
 create mode 100644 package/guile/guile-01-fix_arm_endianness.patch
 create mode 100644 package/guile/guile-02-calculate-csqrt_manually.patch
 create mode 100644 package/guile/guile-03-remove_unused_funcs.patch
 create mode 100644 package/guile/guile.mk

-- 
1.9.1
