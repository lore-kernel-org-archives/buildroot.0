From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu,  8 Jul 2021 13:30:50 +0300
Subject: [Buildroot] [PATCH] package/glibc: bump to version
 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
Message-ID: <20210708103050.2021668-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See:
https://sourceware.org/pipermail/libc-announce/2021/000030.html

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 .../glibc.hash                                                  | 2 +-
 package/glibc/glibc.mk                                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename package/glibc/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f}/glibc.hash (70%)

diff --git a/package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash b/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
similarity index 70%
rename from package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash
rename to package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
index b1d5243fcc..4b8d8297ec 100644
--- a/package/glibc/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/glibc.hash
+++ b/package/glibc/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  f4710e9a435a7b83e1d23dd75434f0d36b898eba9b4249c946c32b467d852fd4  glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz
+sha256  3e2004b16ec6b79a19a88ed4736719ef9e419f9d8e7013faced654c0339e23dc  glibc-2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f84f670fc0..1c8c409878 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -16,7 +16,7 @@ ifeq ($(BR2_RISCV_32),y)
 # Until 2.33 is released, just use master
 GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
 else
-GLIBC_VERSION = 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
+GLIBC_VERSION = 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
 endif
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
-- 
2.31.1
